import 'package:ebozor/feature/create/domain/entity/ad_create_entity.dart';

abstract class AdCreateRepository {
  Future<void> uploadAd(AdCreateEntity ad);
}
