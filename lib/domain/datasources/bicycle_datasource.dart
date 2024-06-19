import '../domain.dart';

abstract class BicycleDatasource {
  Future<List<BicycleDto>> getBicycles();
  Future<Bicycle> getBicycleById(int id);
  Future<List<Bicycle>> searchBicycleByTerm(String term);
  Future<Bicycle> updateOrCreateBicycle(Map<String, dynamic> bicycleLike);
  Future<Bicycle> deleteBicycle(int id);
}
