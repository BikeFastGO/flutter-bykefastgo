import '../domain.dart';

abstract class AuthRepository {
  Future<UserResponse> login(String email, String password);
  Future<UserResponse> register(String fullName, String email, String password ,String confirmPassword);
}
