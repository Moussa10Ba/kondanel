import 'package:flutter/material.dart';
import 'package:kondanel/features/epargne/controllers/epargne_controller.dart';

import '../utils/constant.dart';
import 'package:get/get.dart';

Future<void> showMyDialogTypeEpargne(BuildContext context) async {
  final controller = Get.put(EpargneController());
  int _value = 1;
  var typeEpargne = ['Education', 'voiture', 'Maison et Famille', 'Vancances'];
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        content: SingleChildScrollView(
          child: Container(
              width: 400,
              child: Column(
                  children: <Widget>[
                    for (var i = 0; i < typeEpargne.length; i++)
                      ListTile(
                        title: Text(
                          typeEpargne[i],
                        ),
                        leading: Radio(
                          value: typeEpargne[i],
                          groupValue: typeEpargne,
                          activeColor: Color(0xFF6200EE),
                          onChanged: ( value) {},
                        ),
                      ),
                     TextFormField(
                           keyboardType: TextInputType.text,
                           textAlign: TextAlign.center,
                           decoration:
                           kTextFieldDecoration.copyWith(hintText: 'Categorie de votre epargne'),
                         ),
                     FloatingActionButton(
                       backgroundColor: mainBlueColor,
                      onPressed: () {

                      },
                      child: Icon(Icons.add, color: Colors.white,),
                    ),
                  ],
              ),
              )
          ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              TextButton(
                style: buttonStyle,
                child: const Text('confirmer', style: TextStyle(color: Colors.white),),
                onPressed: () {
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}
