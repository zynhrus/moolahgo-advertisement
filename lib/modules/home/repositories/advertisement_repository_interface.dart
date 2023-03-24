import 'package:moolahgo/modules/home/models/models.dart';

abstract class AdvertisementRepositoryInterface {
  Future<List<PayloadModel>> getAdvertisements();
}
