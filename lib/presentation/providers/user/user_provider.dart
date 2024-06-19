
import 'package:bykefastgo/domain/domain.dart';
import 'package:bykefastgo/presentation/providers/user/user_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/services/key_value_storage_service.dart';
import '../../../shared/services/key_value_storage_service_impl.dart';

final userProvider = StateNotifierProvider<UserNotifier,UserState>((ref){
  final keyValueStorageService = KeyValueStorageImpl();

  return UserNotifier(keyValueStorageService :keyValueStorageService,
            userRepository: ref.watch(userRepositoryProvider));
});


class UserNotifier extends StateNotifier<UserState>{

  final UserRepository userRepository;
  final KeyValueStorage keyValueStorageService;

  UserNotifier({required this.keyValueStorageService, required this.userRepository})
      : super(UserState(isLoading: true)){
    getUserById();
  }



  Future<void> getUserById()async{
      try{
        final userId = await keyValueStorageService.getValue<int>('userId');
        final user = await userRepository.getUserById(userId!);
        state = state.copyWith(user: user,isLoading: false);
      }catch(e){
        state = state.copyWith(isLoading: false);
      }
  }

  Future<void> updateUser(String firstName, String lastName,String email,
      String phone, String birthDate) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try{
      final userId = await keyValueStorageService.getValue<int>('userId');
      final user = await userRepository.updateUser(
          userId!, firstName, lastName, email, phone, birthDate);

    }

    catch (e){
      state = state.copyWith(isLoading: false);
    }
  }

}

class UserState{
  final bool isLoading;
  final UserDto? user;

  UserState({
    this.user,
    this.isLoading = false,
  });

  UserState copyWith({
    bool? isLoading,
    UserDto? user,
  }) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
    );
  }
}
