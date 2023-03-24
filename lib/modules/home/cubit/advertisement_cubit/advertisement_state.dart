part of 'advertisement_cubit.dart';

abstract class AdvertisementState extends Equatable {
  const AdvertisementState();

  @override
  List<Object> get props => [];
}

class AdvertisementInitial extends AdvertisementState {}

class AdvertisementLoading extends AdvertisementState {}

class AdvertisementSuccess extends AdvertisementState {
  final List<PayloadModel> advertisementDatas;

  const AdvertisementSuccess({this.advertisementDatas});

  @override
  List<Object> get props => [advertisementDatas];
}

class AdvertisementFailed extends AdvertisementState {
  final Object error;
  final StackTrace stackTrace;

  const AdvertisementFailed({this.error, this.stackTrace});

  @override
  List<Object> get props => [error, stackTrace];
}
