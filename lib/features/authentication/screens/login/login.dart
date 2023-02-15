import 'package:flutter/material.dart';
import 'package:kondanel/features/authentication/controllers/signup_controller.dart';
import 'package:kondanel/features/authentication/screens/signup_screen/registration.dart';
import 'package:kondanel/screens/management.dart';
import 'package:kondanel/utils/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  Text('Kondane', style: titleTextStyleBlue,),
                  SizedBox(height: 30,),
                  const Text(textDescriptif, textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
                  SizedBox(height: 60,),
                  TextFormField(
                 //   controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                    },
                    decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Numero de telephone'),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                    },
                    decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Mot de passe'),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value){
                      }),
                      Text('Se Souvenir de moi', style: TextStyle(fontSize: 15),),
                      Spacer(),
                      InkWell(
                          onTap: (){

                          },
                          child: Text('Mot de passe oublie', style: TextStyle(fontSize: 15),)

                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                      style:buttonStyle,
                      onPressed: () {
                       // Navigator.pushNamed(context, 'management');
                        //loginUser(_phoneController.text.trim(), context);
                      },
                      child: Text('SE CONNECTER', style: TextStyle(fontSize: 20))
                  ),
                  SizedBox(height: 15,),
                  InkWell(
                      onTap: (){
                        Get.to(RegistrationScreen());
                      },
                      child: const Text('J\ai pas de compte , S\'inscrire', style: TextStyle(fontSize: 15, color: mainBlueColor),)
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
