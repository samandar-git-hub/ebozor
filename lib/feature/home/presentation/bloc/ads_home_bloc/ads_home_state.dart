import 'package:ebozor/feature/home/domain/entity/ads_home_entity.dart';

abstract class AdsHomeState {}

class AdsHomeInitial extends AdsHomeState {}

class AdsHomeLoading extends AdsHomeState {}

class AdsHomeLoaded extends AdsHomeState {
  final List<AdsHomeEntity> ads;

  AdsHomeLoaded(this.ads);
}

class AdsHomeError extends AdsHomeState {
  final String message;

  AdsHomeError(this.message);
}
