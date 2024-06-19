import 'package:bykefastgo/domain/entities/bicycleDto.dart';
import 'package:bykefastgo/shared/util/shared_entities/bicycle_shopping_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SelectDatesShopping extends StatefulWidget {
  final int? id;
  const SelectDatesShopping({Key? key, required this.id}) : super(key: key);

  @override
  State<SelectDatesShopping> createState() => _SelectDatesShoppingState();
}

class _SelectDatesShoppingState extends State<SelectDatesShopping> {
  DateTime startDateTime = DateTime(2023, 11, 20, 10, 20);
  DateTime finishDateTime = DateTime(2023, 11, 20, 10, 20);
  BicycleDto bicycle = bicycles!.last;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Ubicación de la bicicleta"),
        leading: IconButton(
            onPressed: () {
              bicycles!.removeAt(bicycles!.length - 1);
              if (context.canPop()) {
                return context.pop();
              }
              context.go('/bicycle/${widget.id}');
            },
            icon: const Icon(LineAwesomeIcons.angle_left_solid,
                size: 30, color: Colors.black)),
      ),
      body: CupertinoPageScaffold(
          child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 175,
            ),
            const Text("Seleccione la fecha de inicio de la renta"),
            CupertinoButton(
              child: Text(
                  '${startDateTime.month}-${startDateTime.day}-${startDateTime.year}'),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) => SizedBox(
                    height: 250,
                    child: CupertinoDatePicker(
                      backgroundColor: Colors.white,
                      initialDateTime: startDateTime,
                      onDateTimeChanged: (DateTime newTime) {
                        setState(
                          () {
                            startDateTime = newTime;
                          },
                        );
                      },
                      use24hFormat: true,
                      mode: CupertinoDatePickerMode.date,
                    ),
                  ),
                );
              },
            ),
            const Text("Seleccione la fecha de fin de la renta"),
            CupertinoButton(
              child: Text(
                  '${finishDateTime.month}-${finishDateTime.day}-${finishDateTime.year}'),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) => SizedBox(
                    height: 250,
                    child: CupertinoDatePicker(
                      backgroundColor: Colors.white,
                      initialDateTime: finishDateTime,
                      onDateTimeChanged: (DateTime newTime) {
                        setState(
                          () {
                            finishDateTime = newTime;
                          },
                        );
                      },
                      use24hFormat: true,
                      mode: CupertinoDatePickerMode.date,
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {
                    const snackBarNotValid =
                        SnackBar(content: Text('¡Fechas no válidas!'));
                    if (finishDateTime.day - startDateTime.day > 0) {
                      updateTotalPrice(bicycle.bicyclePrice *
                          (finishDateTime.day - startDateTime.day));
                      quantityBicycles!
                          .add(finishDateTime.day - startDateTime.day);
                      const snackBarSuccess = SnackBar(
                        content: Text('¡Bicicleta añadida al carrito!'),
                      );
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackBarSuccess);
                      if (context.canPop()) {
                        return context.pop();
                      }
                      context.go('/bicycle/${widget.id}');
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackBarNotValid);
                    }
                  },
                  child: const Text('Confirmar fechas',
                      style: TextStyle(color: Colors.black))),
            )
          ],
        ),
      )),
    );
  }
}
