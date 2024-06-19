import 'package:bykefastgo/domain/domain.dart';
import 'package:bykefastgo/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storageBicyclesProvider =
    StateNotifierProvider<StorageBicyclesNotifier, Map<int, BicycleDto>>(
  (ref) {
    final localStorageRepository = ref.watch(localStorageRepositoryProvider);
    return StorageBicyclesNotifier(
        localStorageRepository: localStorageRepository);
  },
);

class StorageBicyclesNotifier extends StateNotifier<Map<int, BicycleDto>> {

  int page = 0;
  final LocalStorageRepository localStorageRepository;

  StorageBicyclesNotifier({required this.localStorageRepository}) : super({});

  Future<List<BicycleDto>> loadNextPage() async {
    final bicycles = await localStorageRepository.loadBicycles(
    );
    page++;

    final tempBicyclesMap = <int, BicycleDto>{};

    for (final bicycle in bicycles) {
      tempBicyclesMap[bicycle.bicycleId] = bicycle;
    }

    state = {...state, ...tempBicyclesMap};

    return bicycles;
  }
}
