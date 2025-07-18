import 'package:ebozor/feature/home/domain/entity/ads_home_entity.dart';

abstract class AdsRepository {
  Future<List<AdsHomeEntity>> getAds();
}
