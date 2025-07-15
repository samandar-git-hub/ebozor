import 'package:ebozor/feature/create/domain/usecases/upload_ad_create_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ad_create_event.dart';
import 'ad_create_state.dart';

class AdCreateBloc extends Bloc<AdCreateEvent, AdCreateState> {
  final UploadAdCreateUsecase uploadUsecase;

  AdCreateBloc(this.uploadUsecase) : super(AdCreateInitial()) {
    on<UploadAdEvent>((event, emit) async {
      emit(AdCreateLoading());
      try {
        await uploadUsecase.call(event.ad);
        emit(AdCreateSuccess());
      } catch (e) {
        emit(AdCreateFailure(e.toString()));
      }
    });
    on<ResetAdCreateEvent>((event, emit) {
      emit(AdCreateInitial());
    },);
  }
}
