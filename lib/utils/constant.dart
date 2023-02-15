import 'package:flutter/material.dart';

final titleTextStyleWhite =
    TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 40);
final titleTextStyleBlue =
    TextStyle(fontWeight: FontWeight.bold, color: mainBlueColor, fontSize: 30);

const textDescriptif =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
    ' Faucibus sit tempus, nunc ultrices magnis gravida. ';

const mainBlueColor = Color(0xff23509C);

 ButtonStyle buttonStyle =  ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      )
  ),
  minimumSize: MaterialStateProperty.all(Size(300, 50)),
  backgroundColor: MaterialStateProperty.all(Color(0xff23509C)),
  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
);

ButtonStyle epargneRetraitStyle =  ButtonStyle(
  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      )
  ),
  minimumSize: MaterialStateProperty.all(Size(150, 30)),
  backgroundColor: MaterialStateProperty.all(Color(0xff23509C)),
  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
);


const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  fillColor: Color(0xffD3DCEB),
  filled: true,
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: mainBlueColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

