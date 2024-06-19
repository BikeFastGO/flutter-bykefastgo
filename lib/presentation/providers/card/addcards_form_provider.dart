import 'package:bykefastgo/presentation/providers/card/cards_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddCardFormState {
  final bool isFormPosted;
  final bool isValid;
  final bool isPosting;
  final String cardType;
  final String cardNumber;
  final String cardHolder;
  final String cardExpirationDate;
  final String cardCvv;

  AddCardFormState({
    this.isFormPosted = false,
    this.isValid = false,
    this.isPosting = false,
    this.cardType = '',
    this.cardNumber = '',
    this.cardHolder = '',
    this.cardExpirationDate = '',
    this.cardCvv = ''

  });

  AddCardFormState copyWith({
    bool? isFormPosted,
    bool? isValid,
    bool? isPosting,
    String? cardType,
    String? cardNumber,
    String? cardHolder,
    String? cardExpirationDate,
    String? cardCvv

  }) {
    return AddCardFormState(
      isFormPosted: isFormPosted ?? this.isFormPosted,
      isValid: isValid ?? this.isValid,
      isPosting: isPosting ?? this.isPosting,
      cardType: cardType ?? this.cardType,
      cardNumber: cardNumber ?? this.cardNumber,
      cardHolder: cardHolder ?? this.cardHolder,
      cardExpirationDate: cardExpirationDate ?? this.cardExpirationDate,
      cardCvv: cardCvv ?? this.cardCvv,
    );
  }

  @override
  String toString() {
    return '''
      isFormPosted: $isFormPosted,
      isValid: $isValid,
      isPosting: $isPosting,
      cardType: $cardType,
      cardNumber: $cardNumber,
      cardHolder: $cardHolder,
      cardExpirationDate: $cardExpirationDate,
      cardCvv: $cardCvv
    ''';
  }
}

class AddCardFormNotifier extends StateNotifier<AddCardFormState>{
  final Function(String,String,String,String,String) addCardCallBack;

  AddCardFormNotifier({
    required this.addCardCallBack,
  }): super(AddCardFormState());

  onCardTypeChange(String value){
    final newCardType = value;
    state = state.copyWith(
      cardType: newCardType,
      isValid : true
    );
  }

  onCardNumberChange(String value){
    final newCardNumber = value;
    state = state.copyWith(
        cardNumber: newCardNumber,
        isValid:true
    );
  }

  onCardHolderChange(String value){
    final newCardHolder = value;
    state = state.copyWith(
      cardHolder: newCardHolder,
      isValid: true
    );
  }

  onCardExpirationDateChange(String value){
    final newCardExpirationDate = value;
    state = state.copyWith(
      cardExpirationDate: newCardExpirationDate,
      isValid: true
    );
  }

  onCardCvvChange(String value){
    final newCardCvv = value;
    state  = state.copyWith(
      cardCvv: newCardCvv,
      isValid: true
    );
  }

  Future<void> onSubmit() async{
    _touchEveryField();
    if(state.isValid){
      state = state.copyWith(isPosting: true);
      await addCardCallBack(
        state.cardType,state.cardNumber,state.cardHolder,
          state.cardExpirationDate,state.cardCvv
      );
      state = state.copyWith(isFormPosted: true,isPosting: false);
    }


  }

  _touchEveryField(){
    state = state.copyWith(
      cardType: state.cardType,
      cardCvv: state.cardCvv,
      cardExpirationDate: state.cardExpirationDate,
      cardHolder: state.cardHolder,
      cardNumber: state.cardNumber,
      isValid: true
    );
  }

}

final addCardFormProvider =
    StateNotifierProvider.autoDispose<AddCardFormNotifier,AddCardFormState>(
        (ref){
          final addCardCallback = ref.watch(cardsProvider.notifier).createCard;
          return AddCardFormNotifier(addCardCallBack: addCardCallback);
        }
    );