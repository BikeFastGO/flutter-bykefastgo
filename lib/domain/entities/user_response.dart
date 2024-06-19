class UserResponse {

  final int userId;
  final String token;
  final String refreshToken;
  
  UserResponse({
  
    required this.userId, 
    required this.token, 
    required this.refreshToken
  
  });
}
