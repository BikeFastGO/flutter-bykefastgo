import 'package:isar/isar.dart';

part 'bicycleDto.g.dart';

@collection
class BicycleDto {
  Id? isarId;

  final int bicycleId;
  final String bicycleName;
  final String bicycleDescription;
  final double bicyclePrice;
  final String bicycleSize;
  final String bicycleModel;
  final String imageData;
  final double latitudeData;
  final double longitudeData;


  BicycleDto({
    required this.bicycleId,
    required this.bicycleName,
    required this.bicycleDescription,
    required this.bicyclePrice,
    required this.bicycleSize,
    required this.bicycleModel,
    required this.imageData,
    required this.latitudeData,
    required this.longitudeData,

  });
}
