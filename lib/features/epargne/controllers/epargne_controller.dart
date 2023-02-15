import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EpargneController extends GetxController{
  static EpargneController get instance => Get.find();

  final description = TextEditingController();
  final dateDebut = TextEditingController();
  final dateFin = TextEditingController();
  final montantVise = TextEditingController();
  final typeEpargne = TextEditingController();

}