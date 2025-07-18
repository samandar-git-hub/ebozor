import '../entity/ad_home_entity.dart';
import '../repository/ad_home_repository.dart';

class GetAdByIdUseCase {
  final AdRepository repository;

  GetAdByIdUseCase(this.repository);

  Future<AdHomeEntity> call(String id) {
    return repository.getAdById(id);
  }
}
