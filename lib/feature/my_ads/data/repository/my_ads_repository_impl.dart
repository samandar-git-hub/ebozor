import 'package:ebozor/feature/my_ads/data/source/my_ads_source.dart';
import 'package:ebozor/feature/my_ads/domain/entity/my_ads_entity.dart';
import 'package:ebozor/feature/my_ads/domain/repository/my_ads_repository.dart';

class MyAdsRepositoryImpl implements MyAdsRepository {
  final MyAdsSource source;

  MyAdsRepositoryImpl(this.source);
  @override
  Future<List<MyAdsEntity>> getMyAds(String userId) async {
    final myAdsModel = await source.getMyads(userId);
    final myAdsEntity = myAdsModel.map((e) => e.toMyAdsEntity()).toList();
    return myAdsEntity;
  }
}
