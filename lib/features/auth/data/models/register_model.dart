import 'package:ecommerce_app/features/auth/domain/entities/register.dart';

class RegisterModel extends Register {
  const RegisterModel({
    required super.email,
    required super.name,
    required super.passwrod,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'username': name,
        'password': passwrod,
      };
}
