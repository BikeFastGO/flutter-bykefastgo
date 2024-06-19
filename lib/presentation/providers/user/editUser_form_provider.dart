import 'package:bykefastgo/presentation/providers/user/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

import '../../../shared/util/util.dart';
import '../providers.dart';

class EditUserFormState {
  final bool isFormPosted;
  final bool isValid;
  final bool isPosting;
  final String firstName;
  final String lastName;
  final Email email;
  final String phone;
  final String birthDate;

  EditUserFormState({
    this.isFormPosted = false,
    this.isValid = false,
    this.isPosting = false,
    this.firstName = '',
    this.lastName = '',
    this.email = const Email.pure(),
    this.phone = '',
    this.birthDate = '',
  });

  EditUserFormState copyWith({
    bool? isFormPosted,
    bool? isValid,
    bool? isPosting,
    String? firstName,
    String? lastName,
    Email? email,
    String? phone,
    String? birthDate,
  }) {
    return EditUserFormState(
      isFormPosted: isFormPosted ?? this.isFormPosted,
      isValid: isValid ?? this.isValid,
      isPosting: isPosting ?? this.isPosting,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      birthDate: birthDate ?? this.birthDate,
    );
  }

  @override
  String toString() {
    return '''
      isFormPosted: $isFormPosted,
      isValid: $isValid,
      isPosting: $isPosting,
      firstName: $firstName,
      lastName: $lastName,
      email: $email,
      phone: $phone,
      birthDate: $birthDate,
    ''';
  }
}

class EditUserFormNotifier extends StateNotifier<EditUserFormState>{
  final Function(String, String, String, String, String) updateUserCallBack;

  EditUserFormNotifier({
    required this.updateUserCallBack
  }):super(EditUserFormState());

  onFirstNameChange(String value){
    final newFirstName = value;
    state = state.copyWith(
      firstName: newFirstName,
      isValid: Formz.validate([state.email])
    );
  }

  onLastNameChange(String value){
    final newLastName = value;
    state = state.copyWith(
        lastName: newLastName,
        isValid: Formz.validate([state.email])
    );
  }

  onEmailChange(String value){
    final newEmail = Email.dirty(value);
    state = state.copyWith(
      email: newEmail,
      isValid: Formz.validate([newEmail])
    );
  }

  onPhoneChange(String value){
    final newPhone = value;
    state = state.copyWith(
        phone: newPhone,
        isValid: Formz.validate([state.email])
    );
  }

  onBirthDateChange(String value){
    final newBirthDate = value;
    state = state.copyWith(
        birthDate: newBirthDate,
        isValid: Formz.validate([state.email])
    );
  }

  Future<void>update()async{
    _touchEveryField();
    if(state.isValid){
      if(state.email.isNotValid){
        state = state.copyWith(isFormPosted: true);
        throw Exception('Email no válido');
      }else{
        state = state.copyWith(isPosting: true);
        await updateUserCallBack(
          state.firstName,state.lastName,state.email.value,state.phone,state.birthDate
        );
        state = state.copyWith(isFormPosted: true,isPosting: false);
      }
    }
  }

  _touchEveryField() {
    final newEmail = Email.dirty(state.email.value);
    state = state.copyWith(
        firstName: state.firstName,
        lastName: state.lastName,
        email: newEmail,
        phone: state.phone,
        birthDate: state.birthDate,
        isValid: Formz.validate([newEmail]));
  }

}

final editUserFormProvider= StateNotifierProvider.autoDispose<EditUserFormNotifier,EditUserFormState>(
    (ref){
      final updateUserCallBack = ref.watch(userProvider.notifier).updateUser;
      return EditUserFormNotifier(updateUserCallBack: updateUserCallBack);
    }
);