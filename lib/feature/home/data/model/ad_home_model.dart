import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebozor/feature/home/domain/entity/ad_home_entity.dart';

class AdHomeModel {
  final String id;
  final String title;
  final double price;
  final String description;
  final String contact;
  final DateTime date;
  final String image;

  AdHomeModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.contact,
    required this.date,
    required this.image,
  });

  factory AdHomeModel.fromJson(Map<String, dynamic> json, String id) {
    return AdHomeModel(
      id: id,
      title: json['title'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      description: json['description'] ?? '',
      contact: json['contact'] ?? '',
      date: (json['date'] as Timestamp).toDate(),
      image: json['image'] ?? '',
    );
  }

  AdHomeEntity toEntity() {
    return AdHomeEntity(
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
