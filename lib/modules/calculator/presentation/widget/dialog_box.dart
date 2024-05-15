import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogBox {

  static showResultDialog(double amount){
    Get.dialog(
      barrierDismissible: true,
      Dialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text("Final amount : ${amount.toStringAsFixed(2)}"),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: () => Get.back(),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Colors.blue,
                height: 40,
                minWidth: 120,
                elevation: 4,
                child: const Text("Ok",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}