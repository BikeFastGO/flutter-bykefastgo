import 'package:bykefastgo/domain/domain.dart';

List<int>? quantityBicycles = List<int>.empty(growable: true);
List<BicycleDto>? bicycles = List<BicycleDto>.empty(growable: true);
double totalPrice = 0;
void updateTotalPrice(double price) {
  totalPrice += price;
  totalPrice = double.parse(totalPrice.toStringAsFixed(2));
}
