import 'package:ebozor/feature/home/domain/entity/ad_home_entity.dart';

abstract class AdRepository {
  Future<AdHomeEntity> getAdById(String id);
}
