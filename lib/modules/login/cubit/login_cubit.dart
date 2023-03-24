import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moolahgo/main.library.dart';
import 'package:moolahgo/modules/login/models/models.dart';
import 'package:moolahgo/modules/login/repositories/login_repository_interface.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginRepositoryInterface loginRepository;

  LoginCubit({this.loginRepository}) : super(LoginInitial());

  void login({LoginModel loginData}) async {
    try {
      emit(LoginLoading());
      await loginRepository.login(loginData: loginData);
      emit(LoginSuccess());
    } catch (e, s) {
      print("Error : $e");
      print("stackTrace : $s");
      emit(LoginFailed(error: e, stackTrace: s));
    }
  }
}
