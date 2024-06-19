import 'package:bykefastgo/domain/domain.dart';

class BicycleRepositoryImpl extends BicycleRepository {
  final BicycleDatasource datasource;

  BicycleRepositoryImpl(this.datasource);

  @override
  Future<Bicycle> updateOrCreateBicycle(Map<String, dynamic> bicycleLike) {
    return datasource.updateOrCreateBicycle(bicycleLike);
  }

  @override
  Future<Bicycle> deleteBicycle(int id) {
    return datasource.deleteBicycle(id);
  }

  @override
  Future<Bicycle> getBicycleById(int id) {
    return datasource.getBicycleById(id);
  }

  @override
  Future<List<BicycleDto>> getBicycles() {
    return datasource.getBicycles();
  }

  @override
  Future<List<Bicycle>> searchBicycleByTerm(String term) {
    return datasource.searchBicycleByTerm(term);
  }

}
