
import 'package:dio/dio.dart';
import '../../config/config.dart';
import '../../domain/domain.dart';
import '../infrastructure.dart';

class UserDataSourceImpl extends UserDataSource {
  late final Dio dio;
  final String accessToken;

  UserDataSourceImpl({required this.accessToken})
      : dio = Dio(BaseOptions(
        baseUrl: Environment.apiUrl,
        headers: {'Authorization': 'Bearer $accessToken'},
  ));

  @override
  Future<UserDto> getUserById(int userId) async {
    try {
      final response = await dio.get('/users/$userId');
      final userDtoResponse = UserMapper.userDtoJsonToEntity(response.data);
      return userDtoResponse;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) throw WrongCredentials();
      if (e.type == DioExceptionType.connectionTimeout) throw ConnectioTimeOut();

      throw CustomError(message: 'Cant get the user', errorCode: 500);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<UserDto> updateUser(int userId, String firstName, String lastName,
      String email,String phone, String birthDate)async {
    try{
      
      final userFirstName = firstName;
      final userLastName = lastName;
      final userEmail = email;
      final userPhone = phone;
      final userBirthDate = birthDate;
      
      final response = await dio.put('/users/$userId', data: {
      'userFirstName': userFirstName ,
      'userLastName': userLastName,
      'userEmail': userEmail,
      'userPhone': userPhone ,
      'userBirthDate': userBirthDate});

      final userDto = UserMapper.userDtoJsonToEntity(response.data);
      return userDto;

    }
    catch(e){
      throw Exception();
    }
  }
}





