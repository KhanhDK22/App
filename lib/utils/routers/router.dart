import 'package:app_food_new/ui/create_user/create_user.dart';
import 'package:app_food_new/ui/login/login.dart';
import 'package:app_food_new/ui/products/product.dart';

import 'package:app_food_new/utils/routers/app_path.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(initialLocation: AppPath.init, routes: [
    GoRoute(
      path: AppPath.init,
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      path: AppPath.product,
      builder: (context, state) => const ProductScreen(),
    ),
    GoRoute(
      path: AppPath.createAccount,
      builder: (context, state) => const CreateUser(),
    ),
  ]);
}
