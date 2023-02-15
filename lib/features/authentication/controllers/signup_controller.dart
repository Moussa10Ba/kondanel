
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kondanel/repository/authentication_repository/authentication_repository.dart';
class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();
  final phone = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final email = TextEditingController();

  void registerUser(String email, String password) async {
          AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }

  void phoneAuthentication(String phoneNo){
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }

  void logOut(){
    AuthenticationRepository.instance.logOut();
  }
}