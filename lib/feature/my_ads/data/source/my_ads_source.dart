import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebozor/feature/my_ads/data/model/my_ads_model.dart';

class MyAdsSource {
  final FirebaseFirestore fireStore;

  MyAdsSource(this.fireStore);

  Future<List<MyAdsModel>> getMyads(String userId) async {
    final snapshot = await fireStore
        .collection('ads')
        .where("userId", isEqualTo: userId)
        .get();
    return snapshot.docs
        .map((e) => MyAdsModel.fromJson(e.data(), e.id))
        .toList();
  }
}
