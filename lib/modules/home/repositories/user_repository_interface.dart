import 'package:moolahgo/modules/home/models/models.dart';

abstract class UserRepositoryInterface {
  Future<UserModel> getUser();
}
