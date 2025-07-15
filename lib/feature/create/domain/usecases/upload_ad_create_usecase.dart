import 'package:ebozor/feature/create/domain/entity/ad_create_entity.dart';
import 'package:ebozor/feature/create/domain/repository/ad_create_repository.dart';

class UploadAdCreateUsecase {
  final AdCreateRepository repository;
  UploadAdCreateUsecase(this.repository);

  Future<void> call(AdCreateEntity ad) {
    return repository.uploadAd(ad);
  }
}
