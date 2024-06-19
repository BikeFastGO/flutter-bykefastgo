import 'package:bykefastgo/domain/datasources/local_storage_datasource.dart';
import 'package:bykefastgo/domain/entities/bicycleDto.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatasource extends LocalStorageDatasource {
  late Future<Isar> db;

  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([BicycleDtoSchema],
          inspector: true, directory: dir.path);
    }

    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isFavorite(int bicycleId) async {
    final isar = await db;
    final BicycleDto? isFavorite =
        await isar.bicycleDtos.filter().bicycleIdEqualTo(bicycleId).findFirst();
    return isFavorite != null;
  }

  @override
  Future<List<BicycleDto>> loadBicycles() async {
    final isar = await db;
    return isar.bicycleDtos.where().findAll();
  }

  @override
  Future<void> toggleFavorite(BicycleDto bicycle) async {
    final isar = await db;
    final favoriteBicycle = await isar.bicycleDtos
        .filter()
        .bicycleIdEqualTo(bicycle.bicycleId)
        .findFirst();
    if (favoriteBicycle != null) {
      isar.writeTxnSync(() => isar.bicycleDtos.deleteSync(favoriteBicycle.isarId!));
      return;
    }

    //Insert
    isar.writeTxnSync(() => isar.bicycleDtos.putSync(bicycle));
  }
  
  
  Future<void> removeFromFavorites(BicycleDto bicycle) async {
  final isar = await db;
  final favoriteBicycle = await isar.bicycleDtos
      .filter()
      .bicycleIdEqualTo(bicycle.bicycleId)
      .findFirst();
  if (favoriteBicycle != null) {
    isar.writeTxnSync(() => isar.bicycleDtos.deleteSync(favoriteBicycle.isarId!));
  }
}
  
}
