import 'package:ebozor/feature/home/domain/usecases/get_ads_home_usecase.dart';
import 'package:ebozor/feature/home/presentation/bloc/ads_home_bloc/ads_home_event.dart';
import 'package:ebozor/feature/home/presentation/bloc/ads_home_bloc/ads_home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdsHomeBloc extends Bloc<AdsHomeEvent, AdsHomeState> {
  final GetAdsUseCase getAdsUseCase;

  AdsHomeBloc(this.getAdsUseCase) : super(AdsHomeInitial()) {
    on<LoadAdsHomeEvent>((event, emit) async {
      emit(AdsHomeLoading());
      try {
        final ads = await getAdsUseCase();
        emit(AdsHomeLoaded(ads));
      } catch (e) {
        emit(AdsHomeError(e.toString()));
      }
    });
  }
}