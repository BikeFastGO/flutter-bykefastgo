import 'package:bykefastgo/presentation/providers/bicycle/bicycles_provider.dart';
import 'package:bykefastgo/presentation/providers/user/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class PublishedBicyclesScreen extends ConsumerStatefulWidget {
  const PublishedBicyclesScreen({super.key});
  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 3)),
    );
  }

  @override
  PublishedBicyclesScreenState createState() => PublishedBicyclesScreenState();
}

class PublishedBicyclesScreenState
    extends ConsumerState<PublishedBicyclesScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    ref.read(userProvider.notifier).getUserById();
    loadUser();
  }

  Future<void> loadUser() async {
    try {
      await ref.read(userProvider.notifier).getUserById();
      if (mounted) {
        setState(() {
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
    final bicycleState = ref.watch(userProvider);
    double screenWidth = MediaQuery.of(context).size.width;
    double rowWidth = screenWidth * 0.25;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bicicletas publicadas'),
        actions: [
          IconButton(
            onPressed: () {
              context.push('/bicycle-edit/-1');
            },
            icon: const Icon(LineAwesomeIcons.plus_circle_solid, size: 30),
          ),
        ],
        leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(LineAwesomeIcons.angle_left_solid)),
      ),
      body: ListView.builder(
        itemCount: bicycleState.user?.bicycles.length,
        itemBuilder: (context, index) {
          final bicycle = bicycleState.user?.bicycles[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  context.push('/bicycle/${bicycle.bicycleId}');
                },
                leading: Hero(
                  tag: bicycle!.bicycleId,
                  child: Image.network(
                    bicycle.imageData,
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                ),
                title: Text(bicycle.bicycleName),
                subtitle: Text(bicycle.bicycleDescription),
                trailing: SizedBox(
                  width: rowWidth,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.push('/bicycle-edit/${bicycle.bicycleId}');
                        },
                        icon: const Icon(Icons.edit_outlined),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                '¿Estás seguro de eliminar esta bicicleta?',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              content: const Text(
                                  'Al eliminarlo, este ya no estará disponible para los usuarios'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancelar'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    await ref
                                        .read(bicyclesProvider.notifier)
                                        .deleteBicycle(bicycle.bicycleId);
                                    // ignore: use_build_context_synchronously
                                    Navigator.pop(context, 'OK');

                                    // ignore: use_build_context_synchronously
                                    widget.showSnackBar(
                                        context, 'Bicicleta eliminada');
                                  },
                                  child: const Text('Confirmar'),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
