import 'package:bykefastgo/domain/domain.dart';
import 'card.dart';

class UserDto{
  final int userId;
  final String userFirstName;
  final String userLastName;
  final String userEmail;
  final String userPhone;
  final String userBirthDate;
  final double latitudeData;
  final double longitudeData;
  final String imageData;
  final List<BicycleDto> bicycles;
  final List<CardPayment> cards;

  UserDto({
    required this.userId,
    required this.userFirstName,
    required this.userLastName,
    required this.userEmail,
    required this.userPhone,
    required this.userBirthDate,
    required this.latitudeData,
    required this.longitudeData,
    required this.imageData,
    required this.bicycles,
    required this.cards
  });
}