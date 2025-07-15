import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebozor/feature/create/data/model/ad_create_model.dart';

abstract class AdCreateRemoteSource {
  Future<void> uploadAd(AdCreateModel ad);
}

class AdCreateRemoteSourceImpl implements AdCreateRemoteSource {
  final FirebaseFirestore firestore;

  AdCreateRemoteSourceImpl(this.firestore);

  @override
  Future<void> uploadAd(AdCreateModel ad) async {
    await firestore.collection('ads').add(ad.toJson());
  }
}
