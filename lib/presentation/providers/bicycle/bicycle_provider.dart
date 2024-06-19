import 'package:bykefastgo/domain/domain.dart';
import 'package:bykefastgo/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//autodispose->limpia cuando no se usa
final bicycleProvider = StateNotifierProvider.autoDispose
    .family<BicycleNotifier, BicycleState, int>((ref, bicycleId) {
  return BicycleNotifier(
    bicycleRepository: ref.watch(bicyclesRepositoryProvider),
    bicycleId: bicycleId,
  );
});

class BicycleNotifier extends StateNotifier<BicycleState> {
  final BicycleRepository bicycleRepository;

  BicycleNotifier({
    required this.bicycleRepository,
    required int bicycleId,
  }) : super(BicycleState(id: bicycleId)) {
    loadBicycle();
  }

  BicycleDto newEmptyBicycle() {
    return BicycleDto(
      bicycleId: -1,
      bicycleName: '',
      bicycleDescription: '',
      bicyclePrice: 0,
      bicycleSize: '',
      bicycleModel: '',
      imageData: '',
      latitudeData: 0,
      longitudeData: 0,
    );
  }
  Future<void> loadBicycle() async {
    try {
      if (state.id == -1) {
        state = state.copyWith(bicycle: newEmptyBicycle(), isLoading: false);
        return;
      }

      state = state.copyWith(isLoading: true);
      final bicycle = await bicycleRepository.getBicycleById(state.id);
      state = state.copyWith(bicycle: bicycle.toDto(), isLoading: false);
    } catch (e) {
      print(e);
    }
  }
}

class BicycleState {
  final int id;
  final BicycleDto? bicycle;
  final bool isLoading;
  final bool isSaving;

  BicycleState(
      {required this.id,
      this.bicycle,
      this.isLoading = true,
      this.isSaving = false});

  BicycleState copyWith({
    int? id,
    BicycleDto? bicycle,
    bool? isLoading,
    bool? isSaving,
  }) =>
      BicycleState(
        id: id ?? this.id,
        bicycle: bicycle ?? this.bicycle,
        isLoading: isLoading ?? this.isLoading,
        isSaving: isSaving ?? this.isSaving,
      );
}
