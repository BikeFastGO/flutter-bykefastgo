
import 'package:bykefastgo/domain/domain.dart';

abstract class AuthDataSource {
  Future<UserResponse> login(String email, String password);
  Future<UserResponse> register(String fullName, String email, String password ,String confirmPassword);
}