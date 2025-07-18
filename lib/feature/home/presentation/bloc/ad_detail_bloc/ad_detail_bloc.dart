import 'package:ebozor/feature/home/domain/usecases/get_ad_home_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ad_detail_event.dart';
import 'ad_detail_state.dart';

class AdDetailBloc extends Bloc<AdDetailEvent, AdDetailState> {
  final GetAdByIdUseCase getAdByIdUseCase;

  AdDetailBloc(this.getAdByIdUseCase) : super(AdDetailInitial()) {
    on<LoadAdByIdEvent>(_onLoadAdById);
  }

  Future<void> _onLoadAdById(
    LoadAdByIdEvent event,
    Emitter<AdDetailState> emit,
  ) async {
    emit(AdDetailLoading());
    try {
      final ad = await getAdByIdUseCase(event.adId);
      emit(AdDetailLoaded(ad));
    } catch (e) {
      emit(AdDetailError(e.toString()));
    }
  }
}
