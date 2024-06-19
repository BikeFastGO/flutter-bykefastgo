import 'package:bykefastgo/domain/domain.dart';
import 'package:bykefastgo/infrastructure/infrastructure.dart';
import 'package:flutter/widgets.dart';

class BicycleMapper {
  static Bicycle jsonToEntity(Map<String, dynamic> json) => Bicycle(
        bicycleId: json['id'],
        bicycleName: json['bicycleName'],
        bicycleDescription: json['bicycleDescription'],
        bicyclePrice: double.parse(json['bicyclePrice'].toString()),
        bicycleSize: json['bicycleSize'],
        bicycleModel: json['bicycleModel'],
        imageData:
            json['imageData'] ?? Image.asset('assets/images/no-image.jpg'),
        latitudeData: json['latitudeData'] != null
            ? double.parse(json['latitudeData'].toString())
            : 0.0,
        longitudeData: json['longitudeData'] != null
            ? double.parse(json['longitudeData'].toString())
            : 0.0,
        user: UserMapper.userInfoJsonToEntity(json['userDtoResponse']),
      );
  static BicycleDto dtoJsonToEntity(Map<String, dynamic> json) => BicycleDto(
        bicycleId: json['id'],
        bicycleName: json['bicycleName'],
        bicycleDescription: json['bicycleDescription'],
        bicyclePrice: double.parse(json['bicyclePrice'].toString()),
        bicycleSize: json['bicycleSize'],
        bicycleModel: json['bicycleModel'],
        imageData:
            json['imageData'] ?? Image.asset('assets/images/no-image.jpg'),
        latitudeData: json['latitudeData'] != null
            ? double.parse(json['latitudeData'].toString())
            : 0.0,
        longitudeData: json['longitudeData'] != null
            ? double.parse(json['longitudeData'].toString())
            : 0.0,
      );
}
