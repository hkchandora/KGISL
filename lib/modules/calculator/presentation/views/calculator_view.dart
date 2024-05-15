import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kgisl/modules/calculator/data/models/calculator_input_model.dart';
import 'package:kgisl/modules/calculator/presentation/controllers/calculator_controller.dart';

class CalculatorView extends GetView<CalculatorController> {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        body: controller.isJsonLoaded.isTrue ? SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            autovalidateMode: controller.autoValidateMode.value,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text("Compound Interest Calculator",
                    style: TextStyle(
                      fontSize: controller.calculatorInputModel.fields![0].textSize!
                    ),
                  ),
                  const SizedBox(height: 20),

                  ///RATE OF INTEREST
                  DropdownMenu<Values>(
                    width: Get.width - 40,
                    menuHeight: 250,
                    hintText: controller.calculatorInputModel.fields![0].labelText,
                    inputDecorationTheme: InputDecorationTheme(
                      contentPadding: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
                      hintStyle: TextStyle(
                        color: HexColor.fromHex(controller.calculatorInputModel.fields![0].textColor!),
                        fontSize: controller.calculatorInputModel.fields![0].textSize!
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onSelected: (value) => controller.rate = double.parse(value!.value!),
                    dropdownMenuEntries: controller
                        .calculatorInputModel.fields![0].values!
                        .map<DropdownMenuEntry<Values>>((Values value) {
                      return DropdownMenuEntry<Values>(
                        value: value,
                        label: value.label!,
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),

                  ///PRINCIPAL AMOUNT
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: controller.calculatorInputModel.fields![1].hintText!,
                    ),
                    style: TextStyle(
                      color: HexColor.fromHex(controller.calculatorInputModel.fields![1].textColor!),
                      fontSize: controller.calculatorInputModel.fields![1].textSize!
                    ),
                    controller: controller.principalAmount,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter principal amount";
                      } else {
                        controller.principal = double.parse(value);
                        if(controller.rate >= 1 && controller.rate <= 3 && controller.principal < 10000) {
                          return "Enter minimum amount is 10000";
                        } else if(controller.rate >= 4 && controller.rate <= 7 && controller.principal < 50000) {
                          return "Enter minimum amount is 50000";
                        } else if(controller.rate >= 8 && controller.rate <= 12 && controller.principal < 75000) {
                          return "Enter minimum amount is 75000";
                        } else if(controller.rate > 12 && controller.principal < 100000) {
                          return "Enter minimum amount is 100000";
                        } else {
                          return null;
                        }
                      }
                    },
                    onChanged: (value) {
                      controller.principal = double.parse(value.isEmpty ? "0" : value);
                    },
                  ),
                  const SizedBox(height: 20),

                  ///NO OF TIME TO COMPOUND IN A YEAR
                  DropdownMenu<Values>(
                    width: Get.width - 40,
                    menuHeight: 250,
                    hintText: controller.calculatorInputModel.fields![2].labelText,
                    inputDecorationTheme: InputDecorationTheme(
                      contentPadding: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
                      hintStyle: TextStyle(
                          color: HexColor.fromHex(controller.calculatorInputModel.fields![2].textColor!),
                          fontSize: controller.calculatorInputModel.fields![2].textSize!
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onSelected: (value) => controller.compoundFrequency = int.parse(value!.value!),
                    dropdownMenuEntries: controller
                        .calculatorInputModel.fields![2].values!
                        .map<DropdownMenuEntry<Values>>((Values value) {
                      return DropdownMenuEntry<Values>(
                        value: value,
                        label: value.label!,
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),

                  ///NO OF YEARS
                  DropdownMenu<Values>(
                    width: Get.width - 40,
                    menuHeight: 250,
                    hintText: controller.calculatorInputModel.fields![3].labelText,
                    inputDecorationTheme: InputDecorationTheme(
                      contentPadding: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
                      hintStyle: TextStyle(
                          color: HexColor.fromHex(controller.calculatorInputModel.fields![3].textColor!),
                          fontSize: controller.calculatorInputModel.fields![3].textSize!
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onSelected: (value) => controller.years = int.parse(value!.value!),
                    dropdownMenuEntries: controller
                        .calculatorInputModel.fields![3].values!
                        .map<DropdownMenuEntry<Values>>((Values value) {
                      return DropdownMenuEntry<Values>(
                        value: value,
                        label: value.label!,
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 40),

                  ///CALCULATE BUTTON
                  MaterialButton(
                    onPressed: () => controller.calculateInterest(),
                    color: Colors.blue,
                    height: 40,
                    minWidth: 120,
                    elevation: 4,
                    child: const Text("Calculate",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
          ),
        ) : const Center(child: Text("Loading..."),),
      ),
    );
  }
}
