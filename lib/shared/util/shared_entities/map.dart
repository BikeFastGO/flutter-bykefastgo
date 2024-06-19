import 'package:bykefastgo/domain/entities/my_position.dart';

MyPosition? userPosition;
void setUserPosition(double lat, double long) {
  userPosition = MyPosition(latitude: lat, longitude: long);
}

MyPosition getUserPosition() {
  return userPosition!;
}
