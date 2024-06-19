import 'package:bykefastgo/config/config.dart';
import 'package:bykefastgo/infrastructure/errors/card_errors.dart';
import 'package:bykefastgo/infrastructure/infrastructure.dart';
import 'package:dio/dio.dart';

import 'package:bykefastgo/domain/datasources/card_datasource.dart';
import 'package:flutter/src/material/card.dart';

import '../../domain/entities/card.dart';

class CardDatasourceImpl extends CardDatasource {
  late final Dio dio;
  final String accessToken;

  CardDatasourceImpl({required this.accessToken})
      : dio = Dio(BaseOptions(
            baseUrl: Environment.apiUrl,
            headers: {'Authorization': 'Bearer $accessToken'}));

  @override
  Future<CardPayment> createCard(int userId, CardPayment card) async {
    try {
      // Eliminar guiones ("-") del número de tarjeta
      final sanitizedCardNumber = removeDashes(card.cardNumber);

      final parts = card.cardExpirationDate.split('-');
      final year = "20${parts[0]}";
      final month = parts[1];

      final formattedDate = "$year-$month-01";
      final cardType = card.cardType;
      final cardCvv = card.cardCvv;
      final cardAmount = card.cardAmount;
      final cardHolder = card.cardHolder;

      final response = await dio.post('/cards/$userId', data: {
        "cardNumber": sanitizedCardNumber,
        "cardType": cardType,
        "cardCvv": cardCvv,
        "cardExpirationDate": formattedDate,
        "cardAmount": cardAmount,
        "cardHolder": cardHolder
      });

      final cardResponse = CardMapper.jsonToEntity(response.data);
      return cardResponse;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<CardPayment> deleteCard(int cardId) {
    // TODO: implement deleteCard
    throw UnimplementedError();
  }

  @override
  Future<CardPayment> getCardById(int cardId) async {
    try {
      final response = await dio.get('/cards/$cardId');
      return CardMapper.jsonToEntity(response.data);
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) throw CardPaymentNotFound();
      throw Exception();
    }
  }

  @override
  Future<List<CardPayment>> getCardByUserId(int userId) async {
    final response = await dio.get<List>('/cards/user/$userId');
    final List<CardPayment> cards = [];

    for (final cardJson in response.data ?? []) {
      final cardEntity = CardMapper.jsonToEntity(cardJson);
      final maskedCard = CardPayment(
        id: cardEntity.id,
        cardNumber: maskCardNumber(cardEntity.cardNumber),
        cardType: cardEntity.cardType,
        cardCvv: cardEntity.cardCvv,
        cardExpirationDate: cardEntity.cardExpirationDate,
        cardAmount: cardEntity.cardAmount,
        cardHolder: cardEntity.cardHolder,
        cardMain: cardEntity.cardMain,
      );
      cards.add(maskedCard);
    }

    return cards;
  }

  String maskCardNumber(String cardNumber) {
    // Asegúrate de que cardNumber tenga al menos 4 caracteres
    if (cardNumber.length < 4) {
      return cardNumber;
    }

    // Obtiene los dos primeros y dos últimos dígitos
    final visibleDigits =
        '${cardNumber.substring(0, 2)}** **** **** **${cardNumber.substring(cardNumber.length - 2)}';

    // Agrega un espacio cada 4 dígitos
    final maskedNumber = visibleDigits.replaceAllMapped(
        RegExp(r"(\d{4})"), (match) => '${match[0]} ');

    return maskedNumber;
  }

  String removeDashes(String cardNumber) {
    // Eliminar guiones ("-") del número de tarjeta
    return cardNumber.replaceAll('-', '');
  }

  @override
  Future<CardPayment> updateCard(int cardId, CardPayment card) {
    // TODO: implement updateCard
    throw UnimplementedError();
  }
}
