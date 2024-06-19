

import 'package:bykefastgo/infrastructure/infrastructure.dart';
import 'package:bykefastgo/presentation/providers/auth/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repositories/user_repository.dart';

final userRepositoryProvider = Provider<UserRepository>((ref){
    final accessToken = ref.watch(authProvider).token;
    final userRepository = UserRepositoryImpl(token: accessToken);
    return userRepository;
});