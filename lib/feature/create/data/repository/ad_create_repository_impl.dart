import 'package:ebozor/feature/create/data/model/ad_create_model.dart';
import 'package:ebozor/feature/create/data/source/ad_create_remote_source.dart';
import 'package:ebozor/feature/create/domain/entity/ad_create_entity.dart';
import 'package:ebozor/feature/create/domain/repository/ad_create_repository.dart';

class AdCreateRepositoryImpl implements AdCreateRepository {
  final AdCreateRemoteSource remoteSource;

  AdCreateRepositoryImpl(this.remoteSource);

  @override
  Future<void> uploadAd(AdCreateEntity ad) async {
    final model = AdCreateModel.fromEntity(ad);
    await remoteSource.uploadAd(model);
  }
}
