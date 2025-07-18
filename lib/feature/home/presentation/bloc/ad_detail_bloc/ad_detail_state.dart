import '../../../domain/entity/ad_home_entity.dart';

abstract class AdDetailState {}

class AdDetailInitial extends AdDetailState {}

class AdDetailLoading extends AdDetailState {}

class AdDetailLoaded extends AdDetailState {
  final AdHomeEntity ad;

  AdDetailLoaded(this.ad);
}

class AdDetailError extends AdDetailState {
  final String message;

  AdDetailError(this.message);
}
