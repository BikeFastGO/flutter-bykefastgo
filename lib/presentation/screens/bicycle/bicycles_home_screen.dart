import 'package:bykefastgo/presentation/providers/providers.dart';
import 'package:bykefastgo/shared/util/shared_entities/bicycles_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BicyclesScreen extends ConsumerStatefulWidget {
  const BicyclesScreen({super.key});

  @override
  BicyclesScreenState createState() => BicyclesScreenState();
}

class BicyclesScreenState extends ConsumerState {
  @override
  void initState() {
    super.initState();
    ref.read(bicyclesProvider.notifier).getBicycles();
  }

  final isFavoriteProvider =
      FutureProvider.family.autoDispose((ref, int bicycleId) {
    final localStorageRepository = ref.watch(localStorageRepositoryProvider);
    return localStorageRepository.isFavorite(bicycleId);
  });

  @override
  Widget build(BuildContext context) {
    final bicycleState = ref.watch(bicyclesProvider);
    final textStyle = Theme.of(context).textTheme;
    bicyclesLoaded = bicycleState.bicycles;
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final bicycle = bicycleState.bicycles[index];
            return GestureDetector(
              onTap: () {
                context.push('/bicycle/${bicycle.bicycleId}');
              },
              child: GestureDetector(
                onDoubleTap: () {
                  ref
                      .read(localStorageRepositoryProvider)
                      .toggleFavorite(bicycle);
                },
                child: Card(
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(8),
                          ),
                          child: Hero(
                            tag: bicycle.bicycleId,
                            child: Image.network(
                              bicycle.imageData,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(bicycle.bicycleName,
                            style: textStyle.bodyMedium),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 1.0),
                        child: Text(bicycle.bicycleDescription,
                            style: textStyle.bodySmall),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'S/. ${bicycle.bicyclePrice.toString()}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          childCount: bicycleState.bicycles.length,
        ),
      ),
    );
  }
}
