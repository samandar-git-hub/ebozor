import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebozor/feature/home/domain/entity/ads_home_entity.dart';

class AdsHomeModel {
  final String id;
  final String title;
  final double price;
  final String description;
  final String contact;
  final DateTime date;
  final String image;

  AdsHomeModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.contact,
    required this.date,
    required this.image,
  });

  factory AdsHomeModel.fromJson(Map<String, dynamic> json, String id) {
    return AdsHomeModel(
      id: id,
      title: json['title'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      description: json['description'] ?? '',
      contact: json['contact'] ?? '',
      date: (json['date'] as Timestamp).toDate(),
      image: json['image'] ?? '',
    );
  }

  AdsHomeEntity toEntity() {
    return AdsHomeEntity(
      id: id,
      title: title,
      price: price,
      description: description,
      contact: contact,
      date: date,
      image: image,
    );
  }
}
