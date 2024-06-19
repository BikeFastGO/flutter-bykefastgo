class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String birthDate;
  final double latitude;
  final double longitude;
  final String imageData;

  User(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.birthDate,
      required this.latitude,
      required this.longitude,
      required this.imageData});
}
