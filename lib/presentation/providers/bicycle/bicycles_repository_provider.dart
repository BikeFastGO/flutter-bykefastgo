import 'package:bykefastgo/domain/domain.dart';
import 'package:bykefastgo/infrastructure/infrastructure.dart';
import 'package:bykefastgo/presentation/providers/auth/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bicyclesRepositoryProvider = Provider<BicycleRepository>((ref) {
  final accessToken = ref.watch(authProvider).token;
  final userId = ref.watch(authProvider).userId;
  final bicyclesRepository =
      BicycleRepositoryImpl(BicycleDatasourceImpl(accessToken: accessToken, userId: userId));
  return bicyclesRepository;
});
