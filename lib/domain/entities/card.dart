import 'package:bykefastgo/domain/entities/user.dart';

class CardPayment{
  final int id;
  final String cardNumber;
  final String cardType;
  final String cardCvv;
  final String cardExpirationDate;
  final double cardAmount;
  final String cardHolder;
  final bool cardMain;


  CardPayment({
    required this.id,
    required this.cardNumber,
    required this.cardType,
    required this.cardCvv,
    required this.cardExpirationDate,
    required this.cardAmount,
    required this.cardHolder,
    required this.cardMain,

  });



}