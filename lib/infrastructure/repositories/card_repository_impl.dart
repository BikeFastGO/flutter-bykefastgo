

import 'package:bykefastgo/domain/datasources/card_datasource.dart';
import 'package:bykefastgo/domain/repositories/card_repository.dart';
import 'package:flutter/src/material/card.dart';

import '../../domain/entities/card.dart';

class CardRepositoryImpl extends CardRepository{
  final CardDatasource datasource;

  CardRepositoryImpl(this.datasource);

  @override
  Future<CardPayment> createCard(int userId, CardPayment card) {
    return datasource.createCard(userId, card);
  }

  @override
  Future<CardPayment> deleteCard(int cardId) {
    return datasource.deleteCard(cardId);
  }

  @override
  Future<CardPayment> getCardById(int cardId) {
    return datasource.getCardById(cardId);
  }

  @override
  Future<List<CardPayment>> getCardByUserId(int userId) {
    return datasource.getCardByUserId(userId);
  }

  @override
  Future<CardPayment> updateCard(int cardId, CardPayment card) {
    return datasource.updateCard(cardId, card);
  }

}