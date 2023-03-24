import 'dart:convert';

import 'package:moolahgo/const/api_path.dart';
import 'package:moolahgo/main.library.dart';
import 'package:moolahgo/main.import.dart';
import 'package:moolahgo/modules/login/models/models.dart';
import 'package:moolahgo/utils/rest_api_service/rest_api_interface.dart';

import 'login_repository_interface.dart';

@Injectable(as: LoginRepositoryInterface)
class LoginRepository implements LoginRepositoryInterface {
  final RestApiInterface restApiService;

  const LoginRepository({this.restApiService});

  @override
  Future<void> login({LoginModel loginData}) async {
    final res = await restApiService.post(
      ApiPath.login,
      body: loginData.toJson(),
    );

    final resData = LoginResponseModel.fromJson(
        json.decode(res.data) as Map<String, dynamic>);

    //Save to shared preference
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', resData.token);
  }
}
