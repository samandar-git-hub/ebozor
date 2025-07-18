import 'package:ebozor/feature/my_ads/domain/entity/my_ads_entity.dart';
import 'package:ebozor/feature/my_ads/domain/repository/my_ads_repository.dart';

class GetMyAdsUsecase {
  final MyAdsRepository repository;

  GetMyAdsUsecase(this.repository);

  Future<List<MyAdsEntity>> call(String userId) async {
    return repository.getMyAds(userId);
  }
}
