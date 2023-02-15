import 'package:flutter/material.dart';
import 'package:kondanel/features/authentication/controllers/signup_controller.dart';
import 'package:kondanel/utils/constant.dart';
import 'package:kondanel/screens/budget_list.dart';
import 'package:kondanel/common_widgets/card-list-view.dart';
import 'package:kondanel/common_widgets/alert-dialog.dart';
import 'package:get/get.dart';

class ManagementScreen extends StatefulWidget {
  const ManagementScreen({Key? key}) : super(key: key);

  @override
  State<ManagementScreen> createState() => _ManagementScreenState();
}

class _ManagementScreenState extends State<ManagementScreen> {
  var signupController = Get.put(SignUpController());
  String hideAmount = '**********';
  int amount = 950000;
  String acceuil = 'Acceuil';
  String valueToShow = '**********';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                  children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: const BoxDecoration(
                      color: mainBlueColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))
                  ),
                  child: Text(
                            'Bonjour,  Moussa',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
                  width: 400,
                  height: 150,
                  decoration: cardStyle,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:  [
                           const  Text(
                              'La somme total de vos economies : ',
                              style: TextStyle(fontSize: 15, ),
                             textAlign: TextAlign.center,
                            ),
                            Spacer(),
                            TextButton(
                                onPressed: (){
                                  setState(() {
                                   if(valueToShow == amount.toString()){
                                      valueToShow = hideAmount;
                                   }else{
                                     valueToShow = amount.toString();
                                   }
                                  });
                                },
                                child: const Icon(
                                  Icons.remove_red_eye,
                                  color: mainBlueColor,
                                ))
                          ],
                        ),
                      ),
                        Text(
                        valueToShow + '  FCFA',
                        style: TextStyle(fontSize: 30, color: mainBlueColor, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ]),

              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style:epargneRetraitStyle,
                        onPressed: () {

                        },
                        child: Row(
                          children: [
                            Icon(Icons.remove_circle_outline),
                            Text('  Retrait', style: TextStyle(fontSize: 20)),
                          ],
                        )
                    ),
                    ElevatedButton(
                        style:epargneRetraitStyle,
                        onPressed: () {
                          showMyDialog(context);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.add_circle_outline),
                            Text('  Epargne', style: TextStyle(fontSize: 20)),
                          ],
                        )
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Historique', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),

                   // Spacer(),
                    ElevatedButton(
                      onPressed: () {  },
                      child: Text('Tout voir',  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                              )
                          ),
                          backgroundColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.1))
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              BudgetListScreen(),
              SizedBox(height: 10,),
              BudgetListScreen(),
              SizedBox(height: 10,),
              BudgetListScreen(),
              SizedBox(height: 10,),
              BudgetListScreen(),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 15,
        unselectedFontSize: 15,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: mainBlueColor,
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: Colors.white,),
              label: 'Acceuil' ,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add_card, color: Colors.white),
            label: 'Epargne',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center, color: Colors.white),
            label: 'Service',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts_outlined, color: Colors.white),
            label: 'Reglages',
          ),
        ],
      ),
    );
  }

  Container spacePub(String msg, Color color) {
    return Container(
      margin: EdgeInsets.all(20),
      width: 350,
      decoration: BoxDecoration(
          color: color, borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          msg,
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
