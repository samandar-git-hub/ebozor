import 'package:ebozor/feature/home/domain/entity/ads_home_entity.dart';
import 'package:ebozor/feature/home/domain/repository/ads_home_repository.dart';

class GetAdsUseCase {
  final AdsRepository repository;

  GetAdsUseCase(this.repository);

  Future<List<AdEntity>> call() {
    return repository.getAds();
  }
}
