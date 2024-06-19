import '../domain.dart';

abstract class UserRepository {
  Future<UserDto> getUserById(int userId);
  Future<UserDto> updateUser(int userId, String firstName, String lastName,
      String email,String phone, String birthDate);
}