import 'package:ebozor/feature/home/domain/entity/ads_home_entity.dart';

abstract class AdsState {}

class AdsInitial extends AdsState {}

class AdsLoading extends AdsState {}

class AdsLoaded extends AdsState {
  final List<AdEntity> ads;

  AdsLoaded(this.ads);
}

class AdsFailure extends AdsState {
  final String message;

  AdsFailure(this.message);
}