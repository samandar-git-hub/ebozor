abstract class MyAdsEvent {}

class MyAdsLoadEvent extends MyAdsEvent {
  final String userId;

  MyAdsLoadEvent({required this.userId});
}
