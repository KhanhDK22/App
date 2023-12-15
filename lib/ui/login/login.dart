import 'package:app_food_new/blocs/authen/bloc.dart';
import 'package:app_food_new/blocs/authen/event.dart';
import 'package:app_food_new/blocs/authen/state.dart';
import 'package:app_food_new/data/repositories/authen_repository/authen_repository.dart';
import 'package:app_food_new/utils/extensions/context.dart';
import 'package:app_food_new/utils/routers/app_path.dart';
import 'package:app_food_new/utils/validator/validate.dart';
import 'package:app_food_new/widgets/button.dart';
import 'package:app_food_new/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthenBloc(AuthenRepository()),
      child: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final AuthenBloc authBloc;
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  bool obs = true;
  void changeObs() {
    obs = !obs;
    setState(() {});
  }

  void onLogin() {
    // Chỉ thực hiện login khi không vi phạm các điều iện validate
    if (formKey.currentState?.validate() == true) {
      // Truyền sự kiện vào AuthenBloc
      authBloc.add(
        LoginEvent(
            userName: emailController.text, password: passController.text),
      );
    }
  }

  void disposeController() {
    emailController.dispose();
    passController.dispose();
  }


  @override
  void initState() {
    super.initState();
    authBloc = BlocProvider.of<AuthenBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    disposeController();
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
        Container(
        decoration: const BoxDecoration(
      image: DecorationImage(
      image: AssetImage("assets/images/thummmm.png"),
      fit: BoxFit.cover,
    ),
    ),

      child:  Padding(



          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(

                  hintText: "Nhập user name",
                  controller: emailController,
                  borderType:BorderType.OUTLINE,



                  validate: Validator.requied,
                  prefWidget: const Icon(Icons.email_outlined),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  obs: obs,
                  hintText: "Nhập password",
                  controller: passController,
                  validate: Validator.requied,
                  borderType: BorderType.OUTLINE,
                  sufWidget: IconButton(
                    onPressed: changeObs,
                    icon: Icon(
                      obs
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                    ),
                  ),
                  prefWidget: const Icon(Icons.password_outlined),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                    onTap: () => context.push(AppPath.createAccount),
                    child: const Text(
                      "Bạn chưa có tài khảo? Tạo tài khoản.",
                      style: TextStyle(color: Colors.pink),
                    )),
                const SizedBox(height: 30),

                // Sử dụng bloclistener để lắng nghe sự kiện từ authen bloc
                BlocListener<AuthenBloc, AuthenState>(
                  listener: (context, state) {
                    // nếu sự kiện là loginSuccess thì điều hướng màn hình tới màn home
                    if (state is LoginSuccess) {
                      context.go(AppPath.product);
                    } else if (state is LoginFaild) {
                      // nếu sự kiện là loginFaild thì hiển thị thông báo nhanh
                      context.showSnackBar(
                        content: state.message,
                        isSuccess: false,
                      );
                    }
                  },
                  child: CustomButton(
                    title: "Login",
                    onPressed: onLogin,
                    buttonType: ButtonType.FILL,
                    color: const Color(0xFFDB166E),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }
}
