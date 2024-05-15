import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // /// Profile
    // Get.lazyPut<ProfileApi>(
    //       () => ProfileApiImpl(),
    //   fenix: true,
    // );
    //
    // Get.lazyPut<ProfileRepositoryImpl>(
    //       () => ProfileRepositoryImpl(
    //     Get.find(),
    //   ),
    //   fenix: true,
    // );
  }
}
