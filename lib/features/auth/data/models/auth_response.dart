import 'package:equatable/equatable.dart';

class AuthResponse extends Equatable {
  const AuthResponse({required this.username, required this.email});

  final String username;
  final String email;

  AuthResponse copyWith({String? username, String? email}) {
    return AuthResponse(
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      username: json["username"] ?? "",
      email: json["email"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {"username": username, "email": email};

  @override
  String toString() {
    return "$username, $email, ";
  }

  @override
  List<Object?> get props => [username, email];
}

/*
{
	"username": "username",
	"email": "email"
}*/
