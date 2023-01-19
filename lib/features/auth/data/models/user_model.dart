import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.token,
    required super.auth,
    required super.addresses,
    required super.points,
    required super.favProducts,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        token: json['token'],
        auth: json['auth'],
        addresses: json['addresses'],
        points: json['points'],
        favProducts: json['productsFavorit']
      );
}
