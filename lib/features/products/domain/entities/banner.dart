// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Banner extends Equatable {
  final int id;
  final String title;
  final String img;
  final String link;

  const Banner({
    required this.id,
    required this.title,
    required this.img,
    required this.link,
  });

  @override
  List<Object> get props => [id, title, img, link];
}
