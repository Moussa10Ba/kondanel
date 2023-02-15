import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kondanel/features/authentication/screens/forget_password/forget_password_opt/opt_screen.dart';
import 'package:kondanel/features/authentication/screens/login/login.dart';
import 'package:kondanel/repository/authentication_repository/authentication_repository.dart';
import 'package:kondanel/routes/get_routes.dart';
import 'package:kondanel/screens/logo_page.dart';
import 'package:kondanel/screens/management.dart';
import 'package:kondanel/features/authentication/screens/signup_screen/registration.dart';
import 'package:get/get.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LogoScreen(),
      initialRoute: 'registration',
      getPages: appRoutes(),
    );
  }
}