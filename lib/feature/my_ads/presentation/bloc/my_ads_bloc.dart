import 'package:ebozor/feature/my_ads/domain/usecases/get_my_ads_usecase.dart';
import 'package:ebozor/feature/my_ads/presentation/bloc/my_ads_event.dart';
import 'package:ebozor/feature/my_ads/presentation/bloc/my_ads_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAdsBloc extends Bloc<MyAdsEvent, MyAdsState> {
  final GetMyAdsUsecase getMyAds;

  MyAdsBloc(this.getMyAds) : super(MyAdsInitial()) {
    on<MyAdsLoadEvent>((event, emit) async {
      emit(MyAdsLoading());
      try {
        final ads = await getMyAds(event.userId);
        emit(MyAdsLoaded(ads));
      } catch (e) {
        emit(MyAdsError(e.toString()));
      }
    });
  }
}