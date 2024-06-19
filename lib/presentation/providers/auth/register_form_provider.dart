import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

import '../../../shared/util/util.dart';
import '../providers.dart';

class RegisterFormState {
  final bool isFormPosted;
  final bool isValid;
  final bool isPosting;
  final String fullName;
  final Email email;
  final Password password;
  final Password confirmPassword;

  RegisterFormState({
    this.isFormPosted = false,
    this.isValid = false,
    this.isPosting = false,
    this.fullName = '',
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const Password.pure(),
  });

  RegisterFormState copyWith({
    bool? isFormPosted,
    bool? isValid,
    bool? isPosting,
    String? fullName,
    Email? email,
    Password? password,
    Password? confirmPassword,
  }) {
    return RegisterFormState(
      isFormPosted: isFormPosted ?? this.isFormPosted,
      isValid: isValid ?? this.isValid,
      isPosting: isPosting ?? this.isPosting,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  @override
  String toString() {
    return '''
      isFormPosted: $isFormPosted,
      isValid: $isValid,
      isPosting: $isPosting,
      fullName: $fullName,
      email: $email,
      password: $password,
      confirmPassword: $confirmPassword,
    ''';
  }
}

class RegisterFormNotifier extends StateNotifier<RegisterFormState> {
  final Function(String, String, String, String) registerUserCallback;

  RegisterFormNotifier({
    required this.registerUserCallback,
  }) : super(RegisterFormState());

  onFullNameChange(String value) {
    final newFullName = value;
    state = state.copyWith(
        fullName: newFullName,
        isValid: Formz.validate(
            [state.email, state.password, state.confirmPassword]));
  }

  onEmailChange(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
        email: newEmail,
        isValid:
            Formz.validate([newEmail, state.password, state.confirmPassword]));
  }

  onPasswordChange(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
        password: newPassword,
        isValid:
            Formz.validate([state.email, newPassword, state.confirmPassword]));
  }

  onConfirmPasswordChange(String value) {
    final newConfirmPassword = Password.dirty(value);
    state = state.copyWith(
        confirmPassword: newConfirmPassword,
        isValid:
            Formz.validate([state.email, state.password, newConfirmPassword]));
  }

  Future<void> onSubmit() async{
    _touchEveryField();
    if (state.isValid) {
      if (state.password.value != state.confirmPassword.value) {
        state = state.copyWith(isFormPosted: true);
        throw Exception('Las contraseñas no coinciden');
      } else {
        state = state.copyWith(isPosting: true);
        await registerUserCallback(
            state.fullName, state.email.value, state.password.value, state.confirmPassword.value
        );
        state = state.copyWith(isFormPosted: true, isPosting: false);
      }
    }
  }

  _touchEveryField() {
    final newEmail = Email.dirty(state.email.value);
    final newPassword = Password.dirty(state.password.value);
    final newConfirmPassword = Password.dirty(state.confirmPassword.value);
    state = state.copyWith(
        fullName: state.fullName,
        email: newEmail,
        password: newPassword,
        confirmPassword: newConfirmPassword,
        isValid: Formz.validate([newEmail, newPassword, newConfirmPassword]));
  }
}

final registerFormProvider =
    StateNotifierProvider.autoDispose<RegisterFormNotifier, RegisterFormState>(
        (ref) {
  final registerUserCallback = ref.watch(authProvider.notifier).registerUser;
  return RegisterFormNotifier(registerUserCallback: registerUserCallback);
});
