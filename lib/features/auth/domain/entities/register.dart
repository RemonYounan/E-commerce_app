import 'package:equatable/equatable.dart';

class Register extends Equatable {
  final String email;
  final String name;
  final String passwrod;

  const Register({
    required this.email,
    required this.name,
    required this.passwrod,
  });

  @override
  List<Object> get props => [email, name, passwrod];
}
