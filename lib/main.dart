import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kgisl/config/initial_bindings.dart';
import 'package:kgisl/config/routes.dart';

void main() async {
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return child!;
      },
      title: "KGISL",
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      theme: ThemeData(

        fontFamily: 'Montserrat',
      ),
      initialBinding: InitialBinding(),
      initialRoute: calculator,
      getPages: routes,
    );
  }
}
