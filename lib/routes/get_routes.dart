import 'package:get/get.dart';
import 'package:kondanel/features/authentication/screens/login/login.dart';
import 'package:kondanel/features/authentication/screens/signup_screen/registration.dart';
import 'package:kondanel/screens/management.dart';

appRoutes() => [
  GetPage(
    name: '/management',
    page: () => ManagementScreen(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/login',
    page: () => LoginScreen(),
    middlewares: [MyMiddelware()],
    transition: Transition.leftToRightWithFade,
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/registration',
    page: () => RegistrationScreen(),
    middlewares: [MyMiddelware()],
    transition: Transition.leftToRightWithFade,
    transitionDuration: Duration(milliseconds: 500),
  ),
];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}