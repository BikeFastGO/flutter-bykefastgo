import 'dart:io';

import 'package:bykefastgo/config/config.dart';
import 'package:bykefastgo/infrastructure/infrastructure.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/domain.dart';

class BicycleDatasourceImpl extends BicycleDatasource {
  late final Dio dio;
  final String accessToken;
  final int? userId;

  BicycleDatasourceImpl({required this.accessToken, this.userId})
      : dio = Dio(BaseOptions(
            baseUrl: Environment.apiUrl,
            headers: {'Authorization': 'Bearer $accessToken'}));

  final cloudinary = CloudinaryPublic('dpsyfhahx', 'bykefastgo', cache: false);

  @override
  Future<Bicycle> deleteBicycle(int id) {
    try {
      return dio.delete('/bicycles/$id').then((response) {
        return BicycleMapper.jsonToEntity(response.data);
      });
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Bicycle> getBicycleById(int id) async {
    try {
      final response = await dio.get('/bicycles/bike/$id');
      return BicycleMapper.jsonToEntity(response.data);
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) throw BicycleNotFound();
      throw Exception();
    }
  }

  @override
  Future<List<BicycleDto>> getBicycles() async {
    final response = await dio.get<List>('/bicycles');
    final List<BicycleDto> bicycles = [];
    for (final bicycle in response.data ?? []) {
      bicycles.add(BicycleMapper.dtoJsonToEntity(bicycle));
    }
    return bicycles;
  }

  @override
  Future<List<Bicycle>> searchBicycleByTerm(String term) {
    // TODO: implement searchBicycleByTerm
    throw UnimplementedError();
  }

  Future<String> uploadFile(XFile file) async {
    try {
      File fileToUpload = File(file.path);
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(fileToUpload.path,
            resourceType: CloudinaryResourceType.Image),
      );
      return response.secureUrl;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Bicycle> updateOrCreateBicycle(
      Map<String, dynamic> bicycleLike) async {
    try {
      if (bicycleLike['imageData'] != null &&
          bicycleLike['imageData'] is XFile) {
        XFile imageFile = XFile(bicycleLike['imageData']);
        String imageUrl = await uploadFile(imageFile);
        bicycleLike['imageData'] = imageUrl;
      }

      Response response;
      if (bicycleLike.containsKey('id') && bicycleLike['id'] != null) {
        response = await dio.put(
          '/bicycles/${bicycleLike['id']}',
          data: bicycleLike,
        );
      } else {
        if (userId == null)
          throw ArgumentError('userId is required for creating a new bicycle');
        bicycleLike
            .remove('id'); // Asegúrate de no enviar 'id' si es un objeto nuevo
        response = await dio.post('/bicycles/user/$userId', data: bicycleLike);
      }

      final bicycle = BicycleMapper.jsonToEntity(response.data);
      return bicycle;
    } catch (e) {
      // Captura y maneja la excepción específica
      print(e);
      throw Exception('Failed to update or create bicycle');
    }
  }
}
