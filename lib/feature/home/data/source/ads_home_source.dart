import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebozor/feature/home/data/model/ads_home_model.dart';

abstract class AdsRemoteSource {
  Future<List<AdsHomeModel>> getAds();
}

class AdsRemoteSourceImpl implements AdsRemoteSource {
  final FirebaseFirestore firestore;

  AdsRemoteSourceImpl(this.firestore);

  @override
  Future<List<AdsHomeModel>> getAds() async {
    final snapshot = await firestore
        .collection('ads')
        .orderBy('date', descending: true)
        .get();
    return snapshot.docs
        .map((doc) => AdsHomeModel.fromJson(doc.data(), doc.id))
        .toList();
  }
}
