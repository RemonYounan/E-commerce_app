import '../../domain/entities/banner.dart';

class BannerModel extends Banner {
  const BannerModel({
    required super.id,
    required super.title,
    required super.img,
    required super.link,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json['id'],
        title: json['title'],
        img: json['img'],
        link: json['link'],
      );
}
