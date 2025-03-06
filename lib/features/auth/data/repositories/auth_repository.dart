import 'package:lady_first_flutter/core/network/api_client.dart';
import 'package:lady_first_flutter/features/auth/data/models/auth_response.dart';

class AuthRepository {
  final ApiClient apiClient;
  AuthRepository({required this.apiClient});

  Future<AuthResponse> register() async {
    return AuthResponse(username: "username", email: "email");
  }
}
