import 'package:bykefastgo/domain/domain.dart';

abstract class UserDataSource{
  Future<UserDto> getUserById(int userId);
  Future<UserDto> updateUser(int userId, String firstName, String lastName,
      String email,String phone, String birthDate);
}