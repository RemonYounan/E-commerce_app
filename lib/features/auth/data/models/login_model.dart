import '../../domain/entities/login.dart';

class LoginModel extends Login {
  const LoginModel({
    required super.email,
    required super.password,
  });

  Map<String, dynamic> toJson() => {
        'username': email,
        'password': password,
      };
}
