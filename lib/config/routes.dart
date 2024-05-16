import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:kgisl/modules/calculator/presentation/bindings/calculator_binding.dart';
import 'package:kgisl/modules/calculator/presentation/views/calculator_view.dart';


const String calculator = "calculator";

List<GetPage> routes = [
  GetPage(
    name: '/$calculator',
    page: () => const CalculatorView(),
    binding: CalculatorBinding(),
  ),
];
