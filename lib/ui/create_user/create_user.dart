// ignore_for_file: use_build_context_synchronously

import 'package:app_food_new/data/local_storages/storage.dart';
import 'package:app_food_new/data/models/users/user.dart';
import 'package:app_food_new/mocks/user.dart';
import 'package:app_food_new/utils/extensions/context.dart';
import 'package:app_food_new/utils/validator/validate.dart';
import 'package:app_food_new/widgets/button.dart';
import 'package:app_food_new/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final key = GlobalKey<FormState>();
  var userNameCtrl = TextEditingController();
  var passCtrl = TextEditingController();
  var confirmpassCtrl = TextEditingController();
  String? errorMsg;
  void comparePass() {
    if (passCtrl.text != confirmpassCtrl.text) {
      errorMsg = "Mật khẩu không khớp";
    } else {
      errorMsg = null;
    }
    setState(() {});
  }

  void onCreate() async {
    comparePass();

    if (key.currentState?.validate() == true && errorMsg == null) {
      defaultUser
          .add(User(userName: userNameCtrl.text, password: passCtrl.text));
      await LocalStorage.instance.saveUser(defaultUser);
      context.showSnackBar(content: "Thêm mới thành công", isSuccess: true);
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Thêm mới tài khoản",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 30),
              input(
                ctrl: userNameCtrl,
                title: "Tên đăng nhập",
                hintText: "Nhập tên đăng nhập",
                validate: Validator.requied,
                textStyle:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              input(
                ctrl: passCtrl,
                title: "Mật khẩu",
                hintText: "Nhập mật khẩu",
                validate: Validator.requied,
                textStyle:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              input(
                ctrl: confirmpassCtrl,
                title: "Xác nhận mật khẩu",
                hintText: "Nhập lại mật khẩu",
                validate: Validator.requied,
                textStyle:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              if (errorMsg != null)
                Text(
                  errorMsg!,
                  style: const TextStyle(fontSize: 12, color: Colors.red),
                ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      title: "Hủy",
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      onPressed: () => context.pop(),
                      buttonType: ButtonType.OUTLINE,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomButton(
                      title: "Xác nhận",
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      onPressed: onCreate,
                      buttonType: ButtonType.FILL,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding input({
    String? hintText,
    required TextStyle textStyle,
    required String title,
    String? Function(String?)? validate,
    TextEditingController? ctrl,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textStyle,
          ),
          const SizedBox(height: 4),
          CustomTextField(
            controller: ctrl,
            hintText: hintText,
            validate: validate,
            borderType: BorderType.OUTLINE,
          ),
        ],
      ),
    );
  }
}
