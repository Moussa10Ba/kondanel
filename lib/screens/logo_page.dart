import 'package:flutter/material.dart';

import '../utils/constant.dart';


class LogoScreen extends StatelessWidget {
  const LogoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: mainBlueColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.only(left: width/3, top: height/2),
            child: Column(

              children: [
                Text(
                    'Kondanel',
                  style: titleTextStyleWhite
                ),
                Image(image: AssetImage('images/landingPage.png'), width: 130,),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, 'registration');
        },
        child: Icon(Icons.arrow_circle_right),
      ),
    );
  }
}
