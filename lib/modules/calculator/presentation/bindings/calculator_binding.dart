import 'package:get/get.dart';
import 'package:kgisl/modules/calculator/presentation/controllers/calculator_controller.dart';

class CalculatorBinding extends Bindings{

  @override
  void dependencies() {

    Get.lazyPut<CalculatorController>(() => CalculatorController());
  }

}