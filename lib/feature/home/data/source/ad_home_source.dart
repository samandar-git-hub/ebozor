import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebozor/feature/home/data/model/ad_home_model.dart';

abstract class AdRemoteSource {
  Future<AdHomeModel> getAdById(String id);
}

class AdRemoteSourceImpl implements AdRemoteSource {
  final FirebaseFirestore firestore;

  AdRemoteSourceImpl(this.firestore);

  @override
  Future<AdHomeModel> getAdById(String id) async {
    final doc = await firestore.collection('ads').doc(id).get();
    if (!doc.exists) {
      throw Exception("Ad not found");
    }
    return AdHomeModel.fromJson(doc.data()!, doc.id);
  }
}
