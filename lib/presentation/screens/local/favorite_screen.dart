import 'package:bykefastgo/domain/entities/bicycleDto.dart';
import 'package:bykefastgo/presentation/providers/local/favorite_bicycles_provider.dart';
import 'package:bykefastgo/presentation/providers/local/local_storage_provider.dart';
import 'package:bykefastgo/shared/util/shared_entities/bicycle_shopping_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({super.key});

  @override
  FavoriteScreenState createState() => FavoriteScreenState();
}

class FavoriteScreenState extends ConsumerState<FavoriteScreen> {
  List<BicycleDto>? bicycleDetail = [];

  bool isLoading = false;
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    loadFavoriteBicycle();
  }

  Future<void> loadFavoriteBicycle() async {
    final bicycle =
        await ref.read(storageBicyclesProvider.notifier).loadNextPage();
    if (mounted) {
      setState(() {
        bicycleDetail = bicycle;
      });
    }
  }

  final isFavoriteProvider =
      FutureProvider.family.autoDispose((ref, int bicycleId) {
    final localStorageRepository = ref.watch(localStorageRepositoryProvider);
    return localStorageRepository.isFavorite(bicycleId);
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        leading: IconButton(
            onPressed: () => context.go('/'),
            icon: const Icon(LineAwesomeIcons.angle_left_solid)),
      ),
      body: bicycleDetail!.isEmpty
          ? const Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  LineAwesomeIcons.heart_broken_solid,
                  size: 60,
                  color: Colors.blue,
                ),
                Text(
                  'No tienes bicicletas favoritas, pipipi',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ))
          : ListView.builder(
              itemCount: bicycleDetail?.length ?? 0,
              itemBuilder: (context, index) {
                final bicycle = bicycleDetail?[index];
                return Dismissible(
                  key: Key(bicycle!.bicycleId.toString()),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  secondaryBackground: Container(
                    color: Colors.green,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.shopping_cart, color: Colors.white),
                  ),
                  onDismissed: (direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      await ref
                          .read(localStorageRepositoryProvider)
                          .removeFromFavorites(bicycle);
                      setState(() {
                        bicycleDetail?.removeAt(index);
                      });
                    } else {
                      bicycles!.add(bicycle);
                      updateTotalPrice(bicycle.bicyclePrice);
                    }
                  },
                  child: Card(
                    elevation: 0,
                    color: Colors.white,
                    margin: const EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        leading: Image.network(
                          bicycle.imageData,
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                        title: Text(bicycle.bicycleName),
                        subtitle: Text(bicycle.bicycleDescription),
                        onTap: () {
                          context.push('/bicycle/${bicycle.bicycleId}');
                        },
                        trailing: const Icon(LineAwesomeIcons.angle_right_solid),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
