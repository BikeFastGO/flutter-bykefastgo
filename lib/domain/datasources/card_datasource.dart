import 'package:flutter/material.dart';

import '../domain.dart';

abstract class CardDatasource{
  Future<List<CardPayment>>getCardByUserId(int userId);
  Future<CardPayment>getCardById(int cardId);
  Future<CardPayment>createCard(int userId, CardPayment card);
  Future<CardPayment>updateCard(int cardId, CardPayment card);
  Future<CardPayment>deleteCard(int cardId);
}