import 'package:flutter/material.dart';
import 'package:kondanel/common_widgets/card-list-view.dart';
import 'package:kondanel/common_widgets/dialog_type_epargne.dart';
import 'package:kondanel/features/epargne/controllers/epargne_controller.dart';
import 'package:kondanel/utils/constant.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


Future<void> showMyDialog(BuildContext context) async {
  final controller = Get.put(EpargneController());
  String dropdownValue = 'Dog';
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        content: SingleChildScrollView(
          child: Container(
              width: 400,
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Text(
                        "Creation d’epargne rapide",
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.close_outlined,
                          size: 35,
                          color: mainBlueColor,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                      child: Column(children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Descriptions'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: controller.dateDebut,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.calendar_month),
                            labelText: 'Date Debut'),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2023),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2100),
                            cancelText: 'Annuler',
                          );
                          if(pickedDate != null){
                            String formattedDate =  DateFormat.yMd().format(pickedDate);
                            controller.dateDebut.text = formattedDate.toString();
                          }
                        }


                        ),
                    TextFormField(
                      controller: controller.dateFin,
                        decoration: InputDecoration(
                            icon: Icon(Icons.calendar_month),
                            labelText: 'Date Fin'),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2023),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2100),
                             cancelText: 'Annuler',
                          );
                          if(pickedDate != null){
                            String formattedDate =  DateFormat.yMd().format(pickedDate);
                                controller.dateFin.text = formattedDate.toString();
                          }
                        }

                        ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                      decoration:
                          kTextFieldDecoration.copyWith(hintText: 'Montant'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ]))
                ],
              )),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: buttonStyle,
                child: const Text(
                  'confirmer',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  showMyDialogTypeEpargne(context);
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}
