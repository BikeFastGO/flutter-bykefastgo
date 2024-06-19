import 'package:bykefastgo/domain/entities/bicycle.dart';
import 'package:bykefastgo/presentation/providers/providers.dart';
import 'package:bykefastgo/presentation/screens/screens.dart';
import 'package:bykefastgo/shared/util/shared_entities/bicycle_shopping_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';



class BicycleDetailScreen extends ConsumerStatefulWidget {
  final int id;
  const BicycleDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  ConsumerState<BicycleDetailScreen> createState() =>
      _BicycleDetailScreenState();
}

class _BicycleDetailScreenState extends ConsumerState<BicycleDetailScreen> {
  Bicycle? bicycleDetail;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadBicycleDetail();
  }

  Future<void> loadBicycleDetail() async {
    try {
      final bicycle =
          await ref.read(bicyclesProvider.notifier).getBicycleById(widget.id);
      if (mounted) {
        setState(() {
          bicycleDetail = bicycle;
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return isLoading
        ? const LoadingScreen()
        : Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  if (context.canPop()) {
                    return context.pop();
                  }
                  context.go('/');
                },
                icon:  const Icon(LineAwesomeIcons.bicycle_solid),
              ),
              title: Text(bicycleDetail?.bicycleName ?? ''),
            ),
            body: isLoading
                ? const Center(child: CircularProgressIndicator())
                : bicycleDetail == null
                    ? const Center(child: Text('Bicycle not found'))
                    : ListView(
                        children: [
                          ImageSection(bicycleDetail: bicycleDetail!),
                          ExtraSection(bicycle: bicycleDetail!),
                          UserSection(
                              bicycle: bicycleDetail!, textTheme: textTheme),
                          DescriptionSection(
                            textTheme: textTheme,
                            description: bicycleDetail!.bicycleDescription,
                          ),
                          PriceSection(price: bicycleDetail!.bicyclePrice),
                          InformationSection(
                            label: 'Model',
                            value: bicycleDetail!.bicycleModel,
                            icon: LineAwesomeIcons.bicycle_solid,
                          ),
                          InformationSection(
                            label: 'Size',
                            value: bicycleDetail!.bicycleSize,
                            icon: LineAwesomeIcons.text_height_solid,
                          ),
                          UbicationSection(bicycleDetail: bicycleDetail!),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: FilledButton(
                                        onPressed: () {
                                          const snackBarFailed = SnackBar(
                                            content: Text(
                                                '¡Ya está añadida en el carrito!'),
                                          );
                                          bool isInShoppingCart = false;
                                          if (bicycles!.isNotEmpty) {
                                            for (final bicycle in bicycles!) {
                                              if (bicycle.bicycleId ==
                                                  bicycleDetail!.bicycleId) {
                                                isInShoppingCart = true;
                                              }
                                            }
                                            if (isInShoppingCart) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBarFailed);
                                            } else {
                                              bicycles!
                                                  .add(bicycleDetail!.toDto());
                                              context.push(
                                                  '/select-days-rent/${bicycleDetail!.bicycleId}');
                                            }
                                          } else {
                                            bicycles!
                                                .add(bicycleDetail!.toDto());
                                            context.push(
                                                '/select-days-rent/${bicycleDetail!.bicycleId}');
                                          }
                                        },
                                        child: const Text('Rentar ahora'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: OutlinedButton(
                                        onPressed: () {
                                          const snackBarFailed = SnackBar(
                                            content: Text(
                                                '¡Ya está añadida en el carrito!'),
                                          );
                                          bool isInShoppingCart = false;
                                          if (bicycles!.isNotEmpty) {
                                            for (final bicycle in bicycles!) {
                                              if (bicycle.bicycleId ==
                                                  bicycleDetail!.bicycleId) {
                                                isInShoppingCart = true;
                                              }
                                            }
                                            if (isInShoppingCart) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBarFailed);
                                            } else {
                                              bicycles!
                                                  .add(bicycleDetail!.toDto());
                                              context.push(
                                                  '/select-days-shopping/${bicycleDetail!.bicycleId}');
                                            }
                                          } else {
                                            bicycles!
                                                .add(bicycleDetail!.toDto());
                                            context.push(
                                                '/select-days-shopping/${bicycleDetail!.bicycleId}');
                                          }
                                        },
                                        child: const Text('Agregar al carrito',
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ),
                                    )
                                  ],
                                )),
                          )
                        ],
                      ),
          );
  }
}

class ImageSection extends StatelessWidget {
  final Bicycle bicycleDetail;

  const ImageSection({Key? key, required this.bicycleDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Hero(
        tag: bicycleDetail.bicycleId,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(
            bicycleDetail.imageData,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

final isFavoriteProvider =
    FutureProvider.family.autoDispose((ref, int bicycleId) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return localStorageRepository.isFavorite(bicycleId);
});

class ExtraSection extends ConsumerWidget {
  final Bicycle bicycle;
  const ExtraSection({required this.bicycle, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavoriteFuture = ref.watch(isFavoriteProvider(bicycle.bicycleId));
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: isFavoriteFuture.when(
                  data: (isFavorite) => isFavorite
                      ? const Icon(
                          Icons.favorite_rounded,
                          color: Colors.red,
                        )
                      : const Icon(Icons.favorite_border),
                  error: (_, __) => throw UnimplementedError(),
                  loading: () =>
                      const CircularProgressIndicator(strokeWidth: 2),
                ),
                onPressed: () async {
                  await ref
                      .read(localStorageRepositoryProvider)
                      .toggleFavorite(bicycle.toDto());
                  ref.invalidate(isFavoriteProvider(bicycle.bicycleId));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: const Icon(Icons.share),
                color: Colors.blue,
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: const Icon(LineAwesomeIcons.comment),
                onPressed: () {},
              ),
            ),
          ],
        ));
  }
}

class UserSection extends StatelessWidget {
  final TextTheme textTheme;
  final Bicycle bicycle;
  const UserSection(
      {required this.textTheme, required this.bicycle, super.key});

  @override
  Widget build(BuildContext context) {
    double textScale = MediaQuery.of(context).textScaleFactor;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
      child: RichText(
        text: TextSpan(
          text: 'Publicado por ',
          style: textTheme.bodyLarge?.copyWith(fontSize: 16 * textScale),
          children: <TextSpan>[
            TextSpan(
              text: '${bicycle.user.firstName} ${bicycle.user.lastName}',
              style: textTheme.bodyLarge?.copyWith(
                fontSize: 16 * textScale,
                color: Colors.blue,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DescriptionSection extends StatelessWidget {
  final TextTheme textTheme;
  final String description;

  const DescriptionSection({
    Key? key,
    required this.textTheme,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double textScale = MediaQuery.of(context).textScaleFactor;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        description,
        style: textTheme.bodyLarge?.copyWith(fontSize: 16 * textScale),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class PriceSection extends StatelessWidget {
  final double price;

  const PriceSection({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        'S/${price.toStringAsFixed(2)}',
        style: const TextStyle(
          fontSize: 24.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }
}

class InformationSection extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InformationSection({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}

class UbicationSection extends StatelessWidget {
  final Bicycle? bicycleDetail;
  const UbicationSection({Key? key, required this.bicycleDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(
            '/map/${bicycleDetail!.bicycleId}/${bicycleDetail!.latitudeData}/${bicycleDetail!.longitudeData}');
      },
      child: ListTile(
        leading: const Icon(LineAwesomeIcons.map_marked_solid),
        title: const Text('Ubicación'),
        subtitle: Text(
          'Ir a la ubicación',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
