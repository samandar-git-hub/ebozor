import 'package:ebozor/feature/create/domain/entity/ad_create_entity.dart';

abstract class AdCreateEvent {}

class ResetAdCreateEvent extends AdCreateEvent{}

class UploadAdEvent extends AdCreateEvent {
  final AdCreateEntity ad;

  UploadAdEvent({required this.ad});
}
