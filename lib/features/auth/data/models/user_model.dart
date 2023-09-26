import '../../domain/entities/user.dart';

// ignore: must_be_immutable
class UserModel extends User {
   UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.token,
    required super.auth,
    required super.addresses,
    required super.defaultAddresse,
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
      defaultAddresse: (json['addresses'] as Map).isNotEmpty
          ? (json['addresses'] as Map).keys.first
          : '',
      points: json['points'],
      favProducts: json['productsFavorit']);
}
