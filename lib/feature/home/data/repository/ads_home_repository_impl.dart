
import 'package:ebozor/feature/home/data/source/ads_home_source.dart';
import 'package:ebozor/feature/home/domain/entity/ads_home_entity.dart';
import 'package:ebozor/feature/home/domain/repository/ads_home_repository.dart';

class AdsRepositoryImpl implements AdsRepository {
  final AdsRemoteSource remoteSource;

  AdsRepositoryImpl(this.remoteSource);

  @override
  Future<List<AdEntity>> getAds() {
    return remoteSource.getAds();
  }
}