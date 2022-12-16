import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final String img;
  final int count;

  const Category({
    required this.id,
    required this.name,
    required this.img,
    required this.count,
  });

  @override
  List<Object> get props => [id, name, img, count];
}
