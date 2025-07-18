import 'package:ebozor/feature/my_ads/domain/entity/my_ads_entity.dart';

abstract class MyAdsRepository {
  Future<List<MyAdsEntity>> getMyAds(String userId);
}
