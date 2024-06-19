import '../domain.dart';

abstract class LocalStorageRepository {

  Future<void> toggleFavorite(BicycleDto bicycle);

  Future<bool> isFavorite(int bicycleId);

  Future<List<BicycleDto>> loadBicycles();

  Future<void> removeFromFavorites(BicycleDto bicycle);

}