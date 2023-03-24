import 'dart:convert';

import 'package:moolahgo/const/api_path.dart';
import 'package:moolahgo/main.library.dart';
import 'package:moolahgo/modules/home/models/models.dart';
import 'package:moolahgo/utils/rest_api_service/rest_api_interface.dart';

import 'user_repository_interface.dart';

@Injectable(as: UserRepositoryInterface)
class UserRepository implements UserRepositoryInterface {
  final RestApiInterface restApiService;

  const UserRepository({this.restApiService});

  @override
  Future<UserModel> getUser() async {
    final res = await restApiService.post(ApiPath.user);

    return UserModel.fromJson(json.decode(res.data) as Map<String, dynamic>);
  }
}
