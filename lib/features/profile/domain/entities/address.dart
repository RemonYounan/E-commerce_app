import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String firstName;
  final String lastName;
  final String company;
  final String address1;
  final String address2;
  final String city;
  final String state;
  final String postcode;
  final String country;
  final String email;
  final int phone;

  const Address({
    required this.firstName,
    required this.lastName,
    required this.company,
    required this.address1,
    required this.address2,
    required this.city,
    required this.state,
    required this.postcode,
    required this.country,
    required this.email,
    required this.phone,
  });

  @override
  List<Object> get props {
    return [
      firstName,
      lastName,
      company,
      address1,
      address2,
      city,
      state,
      postcode,
      country,
      email,
      phone,
    ];
  }
}
