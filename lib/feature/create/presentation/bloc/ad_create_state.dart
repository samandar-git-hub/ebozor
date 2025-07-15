abstract class AdCreateState {}

class AdCreateInitial extends AdCreateState {}

class AdCreateLoading extends AdCreateState {}

class AdCreateSuccess extends AdCreateState {}

class AdCreateFailure extends AdCreateState {
  final String message;

  AdCreateFailure(this.message);
}
