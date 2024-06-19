import 'package:bykefastgo/infrastructure/datasources/isar_datasource.dart';
import 'package:bykefastgo/infrastructure/infrastructure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(IsarDatasource());
});
