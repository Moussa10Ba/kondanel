import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:kondanel/features/authentication/controllers/opt_controller.dart';
import 'package:kondanel/utils/constant.dart';
import 'package:get/get.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OTPController());
    var otp;
    return Scaffold(
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Kondane', style: titleTextStyleBlue,),
              SizedBox(height: 50,),
              Text('Veuillez saisir le code envoyer par sms ci dessus',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17),),
              SizedBox(height: 15,),
              Text('Saisir code Otp'),
              SizedBox(height: 20,),
              OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                keyboardType: TextInputType.number,
                onSubmit: (code){
                  otp = code;
                  OTPController.instance.verifyOTP(otp);
                },
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(mainBlueColor),
                  ),
                  onPressed: (){
                    controller.verifyOTP(otp);
                  },
                  child: Text('Next'),
                ),
              )
            ],
          ),
        ),
      );
  }
}
