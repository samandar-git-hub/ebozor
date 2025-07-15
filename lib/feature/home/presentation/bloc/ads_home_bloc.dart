import 'package:ebozor/feature/home/domain/usecases/get_ads_home_usecase.dart';
import 'package:ebozor/feature/home/presentation/bloc/ads_home_event.dart';
import 'package:ebozor/feature/home/presentation/bloc/ads_home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdsBloc extends Bloc<AdsEvent, AdsState> {
  final GetAdsUseCase getAdsUseCase;

  AdsBloc(this.getAdsUseCase) : super(AdsInitial()) {
    on<LoadAdsEvent>((event, emit) async {
      emit(AdsLoading());
      try {
        final ads = await getAdsUseCase();
        emit(AdsLoaded(ads));
      } catch (e) {
        emit(AdsFailure(e.toString()));
      }
    });
  }
}