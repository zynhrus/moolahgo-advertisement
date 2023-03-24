import 'package:moolahgo/main.library.dart';
import 'package:moolahgo/modules/home/models/models.dart';
import 'package:moolahgo/modules/home/repositories/advertisement_repository_interface.dart';

part 'advertisement_state.dart';

@injectable
class AdvertisementCubit extends Cubit<AdvertisementState> {
  final AdvertisementRepositoryInterface advertisementRepository;

  AdvertisementCubit({this.advertisementRepository})
      : super(AdvertisementInitial());

  void advertisementGet({String sortType}) async {
    try {
      emit(AdvertisementLoading());
      List<PayloadModel> advertisementDatas =
          await advertisementRepository.getAdvertisements();
      // Sort by appearance order
      advertisementDatas
          .sort((a, b) => a.appearanceOrder.compareTo(b.appearanceOrder));

      emit(AdvertisementSuccess(advertisementDatas: advertisementDatas));
    } catch (e, s) {
      print("Error : $e");
      print("stackTrace : $s");
      emit(AdvertisementFailed(error: e, stackTrace: s));
    }
  }
}
