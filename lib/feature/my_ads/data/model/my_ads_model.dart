import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebozor/feature/my_ads/domain/entity/my_ads_entity.dart';

class MyAdsModel {
  final String id;
  final String title;
  final double price;
  final DateTime date;
  final String image;

  MyAdsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.date,
    required this.image,
  });

  factory MyAdsModel.fromJson(Map<String, dynamic> json, String id) {
    return MyAdsModel(
      id: id,
      title: json['title'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      date: (json['date'] as Timestamp).toDate(),
      image: json['image'] ?? '',
    );
  }

  MyAdsEntity toMyAdsEntity() {
    return MyAdsEntity(
      id: id,
      title: title,
      price: price,
      date: date,
      image: image,
    );
  }
}
