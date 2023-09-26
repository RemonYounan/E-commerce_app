
import 'package:ecommerce_app/features/profile/domain/entities/address.dart';

class AddressModel extends Address {
  const AddressModel({
    required super.firstName,
    required super.lastName,
    required super.company,
    required super.address1,
    required super.address2,
    required super.city,
    required super.state,
    required super.postcode,
    required super.country,
    required super.email,
    required super.phone,
  });

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'company': company,
        'address_1': address1,
        'address_2': address2,
        'city': city,
        'state': state,
        'postcode': postcode,
        'country': country,
        'email': email,
        'phone': phone,
      };

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        firstName: json['first_name'],
        lastName: json['last_name'],
        company: json['company'],
        address1: json['address_1'],
        address2: json['address_2'],
        city: json['city'],
        state: json['state'],
        postcode: json['postcode'],
        country: json['country'],
        email: json['email'],
        phone: int.parse(json['phone']),
      );
  // String toJson() => json.encode(toMap());

  // factory AddressModel.fromJson(String source) =>
  //     AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
