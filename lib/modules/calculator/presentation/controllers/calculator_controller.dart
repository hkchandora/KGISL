import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kgisl/modules/calculator/data/models/calculator_input_model.dart';
import 'package:kgisl/modules/calculator/presentation/widget/dialog_box.dart';

class CalculatorController extends GetxController{

  final TextEditingController principalAmount = TextEditingController();
  CalculatorInputModel calculatorInputModel = CalculatorInputModel();
  final formKey = GlobalKey<FormState>();
  Rx<AutovalidateMode> autoValidateMode = AutovalidateMode.disabled.obs;
  RxBool isJsonLoaded = false.obs;
  double principal = 0;
  double rate = 0;
  int compoundFrequency = 0;
  int years = 0;

  @override
  void onInit() {
    getValues();
    super.onInit();
  }

  void getValues() async {
    try {
      var loadedData = await rootBundle.loadString("assets/input.json");
      calculatorInputModel = CalculatorInputModel.fromJson(jsonDecode(loadedData));
    } catch (e) {
      Get.snackbar("Server Error", "error in getting stock data");
    }
    isJsonLoaded(true);
  }

  calculateInterest() {
    if(rate == 0){
      showSnackBar(
        calculatorInputModel.fields![0].label!,
        "Kindly select ${calculatorInputModel.fields![0].label!}",
      );
    } else if(compoundFrequency == 0){
      showSnackBar(
        calculatorInputModel.fields![2].label!,
        "Kindly select ${calculatorInputModel.fields![2].label!}",
      );
    } else if(years == 0){
      showSnackBar(
        calculatorInputModel.fields![3].label!,
        "Kindly select ${calculatorInputModel.fields![3].label!}",
      );
    } else if (formKey.currentState!.validate()) {
      double interest = rate / 100; // Convert rate to decimal
      double amount = principal * pow((1 + (interest / compoundFrequency)), compoundFrequency * years);
      DialogBox.showResultDialog(amount);
    } else {
      autoValidateMode.value = AutovalidateMode.onUserInteraction;
    }
  }

  showSnackBar(String title, String description){
    Get.snackbar(
      title,
      description,
      colorText: Colors.white,
      backgroundColor: Colors.lightBlue,
      icon: const Icon(Icons.add_alert_rounded),
    );
  }
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}