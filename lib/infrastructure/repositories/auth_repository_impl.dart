import '../../domain/domain.dart';
import '../infrastructure.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({AuthDataSource? dataSource})
      : dataSource = dataSource ?? AuthDataSourceImpl();


  @override
  Future<UserResponse> login(String email, String password) {
    return dataSource.login(email, password);
  }

  @override
  Future<UserResponse> register(String fullName, String email, String password ,String confirmPassword) {
    return dataSource.register(fullName, email, password, confirmPassword);
  }
}
