import 'package:app_food_new/blocs/authen/event.dart';
import 'package:app_food_new/blocs/authen/state.dart';
import 'package:app_food_new/data/local_storages/storage.dart';
import 'package:app_food_new/data/repositories/authen_repository/i_authen_repository.dart';
import 'package:app_food_new/mocks/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenBloc extends Bloc<AuthenEvent, AuthenState> {
  final IAuthenRepository authenRepository;
  AuthenBloc(this.authenRepository) : super(AuthenInit()) {
    on<LoginEvent>(_onLogin);
  }

  Future _onLogin(LoginEvent event, Emitter emitter) async {
    // emitter là một phần của thư viện flutter_bloc. Chịu trách nghiệm phát ra trạng thái mới để rebuild UI
    emitter(Loading());
    // ĐOẠN NÀY CHỈ LÀ VÍ DỤ. THỰC TẾ SẼ DÙNG PHẦN AUTHENREPOSITORY Ở DƯỚI
    defaultUser = await LocalStorage.instance.getListUser();
    bool isAuthen = defaultUser.any((element) =>
        (element.userName == event.userName) &&
        (element.password == event.password));
    if (isAuthen) {
      return emitter(LoginSuccess());
    }
    return emitter(
      LoginFaild("Mật khẩu hoặc tên đăng nhập không đúng"),
    );
    // (await authenRepository.login(
    //         password: event.password, userName: event.userName))
    //     .on(
    //   whenSuccess: (whenSuccess) => emitter(LoginSuccess()),
    //   whenFaild: (whenFaild) => emitter(
    //     LoginFaild("Mật khẩu hoặc tên đăng nhập không đúng"),
    //   ),
    // );
  }
}
