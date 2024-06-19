import 'package:bykefastgo/shared/util/shared_entities/bicycle_shopping_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrito de compras"),
        leading: IconButton(
            onPressed: () {
              if (context.canPop()) {
                return context.pop();
              }
              context.go('/');
            },
            icon: const Icon(
              LineAwesomeIcons.angle_left_solid,
            )),
      ),
      body: bicycles!.isEmpty
          ? const Center(
              child: Text("Carrito vacío...", style: TextStyle(fontSize: 20)),
            )
          : Consumer(
              builder: (context, value, child) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: bicycles!.length,
                        itemBuilder: (context, index) {
                          final bicycle = bicycles![index];
                          final quantity = quantityBicycles![index];
                          return Padding(
                            padding:
                                const EdgeInsets.fromLTRB(12.0, 5, 12.0, 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8)),
                              child: ListTile(
                                onTap: () {
                                  context.push('/bicycle/${bicycle.bicycleId}');
                                },
                                leading: Image.network(
                                  bicycle.imageData,
                                  fit: BoxFit.contain,
                                  width: 100, // Adjust the height as needed
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16.0),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(bicycle.bicycleName),
                                    Text('S/ ${bicycle.bicyclePrice}'),
                                    Text('Cantidad de días: $quantity')
                                  ],
                                ),
                                trailing: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      bicycles!.remove(bicycle);
                                      quantityBicycles!.removeAt(index);
                                      updateTotalPrice(bicycle.bicyclePrice *
                                          -1.0 *
                                          quantity);
                                    });
                                  },
                                  child: const Icon(Icons.cancel,
                                      color: Colors.red),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8)),
                        padding: EdgeInsets.fromLTRB(14, 5, 14, 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Total:", style: TextStyle(fontSize: 20)),
                                Spacer(),
                                Text("S/ $totalPrice",
                                    style: TextStyle(fontSize: 17)),
                              ],
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all<Size>(
                                      Size(double.infinity, 40.0)),
                                  padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(horizontal: 4)),
                                ),
                                onPressed: () {},
                                child: Text("Continuar compra"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
