import 'dart:convert';

import 'package:moolahgo/const/api_path.dart';
import 'package:moolahgo/main.library.dart';
import 'package:moolahgo/modules/home/models/models.dart';
import 'package:moolahgo/utils/rest_api_service/rest_api_interface.dart';

import 'advertisement_repository_interface.dart';

@Injectable(as: AdvertisementRepositoryInterface)
class AdvertisementRepository implements AdvertisementRepositoryInterface {
  final RestApiInterface restApiService;

  const AdvertisementRepository({this.restApiService});

  @override
  Future<List<PayloadModel>> getAdvertisements() async {
    final res = await restApiService.post(ApiPath.advertisement);
    final AdvertisementModel advertisement = AdvertisementModel.fromJson(
        json.decode(res.data) as Map<String, dynamic>);

    return advertisement.payload;
  }
}
