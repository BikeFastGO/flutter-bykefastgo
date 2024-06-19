import 'package:bykefastgo/domain/domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'bicycles_repository_provider.dart';

final bicyclesProvider = StateNotifierProvider<BicyclesNotifier, BicycleState>(
    (ref) => BicyclesNotifier(
        bicycleRepository: ref.watch(bicyclesRepositoryProvider)));

class BicyclesNotifier extends StateNotifier<BicycleState> {
  final BicycleRepository bicycleRepository;
  BicyclesNotifier({
    required this.bicycleRepository
    }) : super(BicycleState()) {
    getBicycles();
  }

  Future<bool> updateBicycle(Map<String, dynamic> bicycleLike) async {
    try {
      final bicycle = await bicycleRepository.updateOrCreateBicycle(bicycleLike);
      final bicycles = state.bicycles.map((b) {
        if (b.bicycleId == bicycle.bicycleId) {
          return bicycle.toDto();
        }
        return b;
      }).toList();
      state = state.copyWith(bicycles: bicycles);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteBicycle(int id) async {
    try {
      await bicycleRepository.deleteBicycle(id);
      final bicycles = state.bicycles.where((b) => b.bicycleId != id).toList();
      state = state.copyWith(bicycles: bicycles);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> getBicycles() async {
    final bicycles = await bicycleRepository.getBicycles();
    state = state.copyWith(bicycles: bicycles);
  }

  Future<Bicycle> getBicycleById(int id) async {
    return await bicycleRepository.getBicycleById(id);
  }
}

class BicycleState {
  final List<BicycleDto> bicycles;

  BicycleState({this.bicycles = const []});

  // Factory constructor for initial state
  factory BicycleState.initial() {
    return BicycleState(bicycles: []);
  }

  BicycleState copyWith({
    List<BicycleDto>? bicycles,
  }) {
    return BicycleState(
      bicycles: bicycles ?? this.bicycles,
    );
  }
}
