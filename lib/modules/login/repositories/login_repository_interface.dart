import 'package:moolahgo/modules/login/models/models.dart';

abstract class LoginRepositoryInterface {
  Future<void> login({LoginModel loginData});
}
