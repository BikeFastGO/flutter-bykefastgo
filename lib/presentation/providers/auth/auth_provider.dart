import 'package:bykefastgo/infrastructure/infrastructure.dart';
import 'package:bykefastgo/shared/services/key_value_storage_service.dart';
import 'package:bykefastgo/shared/services/key_value_storage_service_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';

//! 1 - Inicializamos el state
//Creas una clase para representar el estado de tu aplicación.

enum AuthStatus { checking, authenticated, notAunthenticated }

class AuthState {
  final AuthStatus authStatus;
  final UserResponse? user;
  final String token;
  final String errorMessage;
  final int userId;

  AuthState(
      {this.authStatus = AuthStatus.checking,
      this.user,
      this.token = '',
      this.errorMessage = '',
      this.userId = -1});

  AuthState copyWith({
    AuthStatus? authStatus,
    UserResponse? user,
    String? errorMessage,
    String? token,
    int? userId,
  }) =>
      AuthState(
        authStatus: authStatus ?? this.authStatus,
        user: user ?? this.user,
        token: token ?? this.token,
        errorMessage: errorMessage ?? this.errorMessage,
        userId: userId ?? this.userId,
      );
}

//! 2 - Crear un Notificador de Estado
//Creas una clase que extiende StateNotifier y toma tu estado como parámetro
//Esta clase contiene la lógica para cambiar el estado y notificar a los oyentes sobre los cambios.

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  final KeyValueStorage keyValueStorageService;

  AuthNotifier(
      {required this.keyValueStorageService, required this.authRepository})
      : super(AuthState()) {
    checkToken();
  }

  Future<void> loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final user = await authRepository.login(email, password);
      
      _setLoggedUsers(user);
    } on WrongCredentials {
      logOut('Credenciales no son correctas');
    } on ConnectioTimeOut {
      logOut('TimeOut');
    } catch (e) {
      logOut('Error no controlado');
    }
  }

  Future<void> registerUser(String fullName, String email, String password,
      String confirmPassword) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      final user = await authRepository.register(
          fullName, email, password, confirmPassword);
      _setLoggedUsers(user);
    } on WrongCredentials {
      logOut('Credenciales ya existen');
    } on ConnectioTimeOut {
      logOut('TimeOut');
    } catch (e) {
      logOut('Error no controlado');
    }
  }

  Future<void> logOut([String? errorMessage]) async {
    await keyValueStorageService.removeKey('token');
    await keyValueStorageService.removeKey('userId');
    state = state.copyWith(
      authStatus: AuthStatus.notAunthenticated,
      user: null,
      errorMessage: errorMessage,
    );
  }

  void checkToken() async {
    final token = await keyValueStorageService.getValue<String>('token');
    final userId = await keyValueStorageService.getValue<int>('userId');

    if (token == null) {
      return logOut();
    } else {
      state = state.copyWith(
        authStatus: AuthStatus.authenticated,
        token: token,
        userId: userId,
      );
    }
  }

  void _setLoggedUsers(UserResponse user) async {
    await keyValueStorageService.setKeyValue('token', user.token);
    await keyValueStorageService.setKeyValue('userId', user.userId);
    state = state.copyWith(
      user: user,
      authStatus: AuthStatus.authenticated,
      errorMessage: '',
      token: user.token,
      userId: user.userId,
    );
  }
}

//! Proporcionar el Notificador de Estado
//Usas un StateNotifierProvider para proporcionar tu notificador de estado a tu árbol de widgets

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();
  final keyValueStorageService = KeyValueStorageImpl();
  return AuthNotifier(
      authRepository: authRepository,
      keyValueStorageService: keyValueStorageService);
});
