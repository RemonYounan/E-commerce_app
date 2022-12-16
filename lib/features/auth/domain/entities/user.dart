// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String token;
  final String auth;
  final Map<String, dynamic> addresses;
  final int points;
  final Map<String, dynamic> favProducts;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    required this.auth,
    required this.addresses,
    required this.points,
    required this.favProducts,
  });

  @override
  List<Object> get props =>
      [id, name, email, token, auth, addresses, points, favProducts];
}
