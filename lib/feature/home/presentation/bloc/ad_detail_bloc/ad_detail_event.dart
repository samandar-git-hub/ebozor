abstract class AdDetailEvent {}

class LoadAdByIdEvent extends AdDetailEvent {
  final String adId;

  LoadAdByIdEvent(this.adId);
}
