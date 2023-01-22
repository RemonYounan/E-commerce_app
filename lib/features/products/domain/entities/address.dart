import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String label;
  final String? type;
  final String? placeHolder;
  final bool isRequired;

  const Address({
    required this.label,
    this.type,
    this.placeHolder,
    required this.isRequired,
  });

  @override
  List<Object> get props => [label, isRequired];
}
