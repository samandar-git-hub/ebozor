import 'package:ebozor/feature/my_ads/domain/entity/my_ads_entity.dart';

abstract class MyAdsState {}

class MyAdsInitial extends MyAdsState {}

class MyAdsLoading extends MyAdsState {}

class MyAdsLoaded extends MyAdsState {
  final List<MyAdsEntity> myAds;

  MyAdsLoaded(this.myAds);
}

class MyAdsError extends MyAdsState {
  final String message;

  MyAdsError(this.message);
}
