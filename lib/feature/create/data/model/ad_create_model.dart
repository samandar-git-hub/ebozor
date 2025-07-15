import 'package:ebozor/feature/create/domain/entity/ad_create_entity.dart';

class AdCreateModel {
  final String title;
  final double price;
  final String description;
  final String contact;
  final String date;
  final String image;

  AdCreateModel({
    required this.title,
    required this.price,
    required this.description,
    required this.contact,
    required this.date,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
    'title': title,
    'price': price,
    'description': description,
    'contact': contact,
    'date': date,
    'image': image,
  };

  factory AdCreateModel.fromEntity(AdCreateEntity entity) {
    return AdCreateModel(
      title: entity.title,
      price: entity.price,
      description: entity.description,
      contact: entity.contact,
      date: entity.date,
      image: entity.image,
    );
  }
}
