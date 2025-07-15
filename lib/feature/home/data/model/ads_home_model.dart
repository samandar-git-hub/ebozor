
import 'package:ebozor/feature/home/domain/entity/ads_home_entity.dart';

class AdModel extends AdEntity {
  const AdModel({
    required String id,
    required String title,
    required double price,
    required String description,
    required String contact,
    required String date,
    required String image,
  }) : super(
          id: id,
          title: title,
          price: price,
          description: description,
          contact: contact,
          date: date,
          image: image,
        );

  factory AdModel.fromJson(Map<String, dynamic> json, String id) {
    return AdModel(
      id: id,
      title: json['title'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      description: json['description'] ?? '',
      contact: json['contact'] ?? '',
      date: json['date'] ?? '',
      image: json['image'] ?? '',
    );
  }
}