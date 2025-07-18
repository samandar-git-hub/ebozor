import 'package:ebozor/feature/create/domain/entity/ad_create_entity.dart';

class AdCreateModel {
  final String userId;
  final String title;
  final double price;
  final String description;
  final String contact;
  final DateTime date;
  final String image;

  AdCreateModel({
    required this.userId,
    required this.title,
    required this.price,
    required this.description,
    required this.contact,
    required this.date,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'title': title,
    'price': price,
    'description': description,
    'contact': contact,
    'date': date,
    'image': image,
  };

  factory AdCreateModel.fromEntity(AdCreateEntity entity) {
    return AdCreateModel(
      userId: entity.userId,
      title: entity.title,
      price: entity.price,
      description: entity.description,
      contact: entity.contact,
      date: entity.date,
      image: entity.image,
    );
  }
}
