import 'package:bykefastgo/domain/domain.dart';

import '../infrastructure.dart';

class UserMapper {
  static UserResponse userJsonToEntity(Map<String, dynamic> json) =>
      UserResponse(
          userId: json['user_id'],
          token: json['access_token'],
          refreshToken: json['refresh_token']);

  static UserDto userDtoJsonToEntity(Map<String,dynamic>json) =>
      UserDto(
        userId: json['id'],
        userFirstName: json['userFirstName'],
        userLastName: json['userLastName'],
        userEmail: json['userEmail'],
        userPhone: json['userPhone'],
        userBirthDate: json['userBirthDate'],
        latitudeData: (json['latitudeData'] is num) ? json['latitudeData'].toDouble() : 0.0,
        longitudeData: (json['longitudeData'] is num) ? json['longitudeData'].toDouble() : 0.0,
        imageData: json['imageData'],
        bicycles: List<BicycleDto>.from(json['bicycles'].map((x) => BicycleMapper.dtoJsonToEntity(x))),
        cards: List<CardPayment>.from(json['cards'].map((x) => CardMapper.jsonToEntity(x))),
      );

  static User userInfoJsonToEntity(Map<String, dynamic>json) =>
      User(
        id: json['id'],
        firstName: json['userFirstName'],
        lastName: json['userLastName'],
        email: json['userEmail'],
        phone: json['userPhone'],
        birthDate: json['userBirthDate'],
        latitude: (json['latitudeData'] is num) ? json['latitudeData'].toDouble() : 0.0,
        longitude: (json['longitudeData'] is num) ? json['longitudeData'].toDouble() : 0.0,
        imageData: json['imageData'],
      );
}

