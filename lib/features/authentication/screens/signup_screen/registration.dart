import 'package:flutter/material.dart';
import 'package:kondanel/features/authentication/screens/forget_password/forget_password_opt/opt_screen.dart';
import 'package:kondanel/features/authentication/screens/login/login.dart';

import '../../../../utils/constant.dart';
import 'package:get/get.dart';

import '../../controllers/signup_controller.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                    children: [
                      Text('Kondane', style: titleTextStyleBlue,),
                      SizedBox(height: 30,),
                      const Text(textDescriptif, textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
                      SizedBox(height: 60,),
                      TextFormField(
                        controller: controller.phone,
                        keyboardType: TextInputType.phone,
                        textAlign: TextAlign.center,
                        decoration:
                        kTextFieldDecoration.copyWith(hintText: 'Numero de telephone'),
                      ),
                      // TextFormField(
                      //   controller: controller.email,
                      //   keyboardType: TextInputType.emailAddress,
                      //   textAlign: TextAlign.center,
                      //
                      //   decoration:
                      //   kTextFieldDecoration.copyWith(hintText: 'Adresse mail'),
                      // ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: controller.name,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        decoration:
                        kTextFieldDecoration.copyWith(hintText: 'Nom complet'),
                      ),
                      SizedBox(height: 20,),
                      // TextFormField(
                      //   controller: controller.password,
                      //   obscureText: true,
                      //   textAlign: TextAlign.center,
                      //   decoration:
                      //   kTextFieldDecoration.copyWith(hintText: 'Mot de passe'),
                      // ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                          style:buttonStyle,
                          onPressed: () {
                            print('-----------------------------------');
                            print(controller.phone.text.trim());
                            print('-----------------------------------');
                            if(formKey.currentState!.validate()){
                              SignUpController.instance.phoneAuthentication(controller.phone.text.trim());
                              Get.to(OTPScreen());
                            }
                          },
                          child: Text('CREER UN COMPTE', style: TextStyle(fontSize: 20))
                          ),
                      SizedBox(height: 15,),
                      InkWell(
                          onTap: (){
                            Get.to(LoginScreen());
                          },
                          child: const Text('J\ai un compte , Se connecter', style: TextStyle(fontSize: 15, color: mainBlueColor),)

                      ),
                    ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
