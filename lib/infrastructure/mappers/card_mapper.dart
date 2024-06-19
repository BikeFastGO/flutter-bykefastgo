import '../../domain/domain.dart';

class CardMapper {
  static CardPayment jsonToEntity(Map<String, dynamic> json) => CardPayment(
        id: json['id'],
        cardNumber: json['cardNumber'],
        cardType: json['cardType'],
        cardCvv: json['cardCvv'],
        cardExpirationDate: json['cardExpirationDate'],
        cardAmount: double.parse(json['cardAmount'].toString()),
        cardHolder: json['cardHolder'],
        cardMain: bool.parse(json['cardMain'].toString()),
    );

}
