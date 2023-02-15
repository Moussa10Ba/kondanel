import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kondanel/repository/authentication_repository/authentication_repository.dart';
import 'package:kondanel/screens/management.dart';

class OTPController extends GetxController{
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async{
    print('-------------------------');
    print(otp);
    print('-------------------------');
    var isVerfidied = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerfidied ? Get.offAll(ManagementScreen()) : Get.back();
  }
}