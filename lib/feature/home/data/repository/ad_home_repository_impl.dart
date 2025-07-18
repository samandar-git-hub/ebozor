import 'package:ebozor/feature/home/data/model/ad_home_model.dart';
import 'package:ebozor/feature/home/data/source/ad_home_source.dart';
import 'package:ebozor/feature/home/domain/entity/ad_home_entity.dart';
import 'package:ebozor/feature/home/domain/repository/ad_home_repository.dart';

class AdRepositoryImpl implements AdRepository {
  final AdRemoteSource remoteSource;

  AdRepositoryImpl(this.remoteSource);

  @override
  Future<AdHomeEntity> getAdById(String id) async {
    final AdHomeModel adModel = await remoteSource.getAdById(id);
    return adModel.toEntity();
  }
}
