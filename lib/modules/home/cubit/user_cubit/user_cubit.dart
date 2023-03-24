import 'package:moolahgo/main.library.dart';
import 'package:moolahgo/modules/home/models/models.dart';
import 'package:moolahgo/modules/home/repositories/user_repository_interface.dart';

part 'user_state.dart';

@injectable
class UserCubit extends Cubit<UserState> {
  final UserRepositoryInterface userRepository;

  UserCubit({this.userRepository}) : super(UserInitial());

  void userGet() async {
    try {
      emit(UserLoading());
      final userData = await userRepository.getUser();
      emit(UserSuccess(userData: userData));
    } catch (e, s) {
      print("Error : $e");
      print("stackTrace : $s");
      emit(UserFailed(error: e, stackTrace: s));
    }
  }
}
