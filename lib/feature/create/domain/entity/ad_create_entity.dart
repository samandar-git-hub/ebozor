class AdCreateEntity {
  final String title;
  final String userId;
  final double price;
  final String description;
  final String contact;
  final DateTime date;
  final String image;

  const AdCreateEntity({
    required this.title,
    required this.userId,
    required this.price,
    required this.description,
    required this.contact,
    required this.date,
    required this.image,
  });
}