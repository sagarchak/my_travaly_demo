import 'package:get/get.dart';
import 'package:my_travaly_demo/controller/home_controller.dart';
import 'package:my_travaly_demo/controller/login_and_sign_up_controller.dart';

class AppBinding extends Bindings {
  Future<void> dependencies() async {
    Get.put<LoginAndSignUpController>(LoginAndSignUpController(), permanent: false);
    Get.put<HomeController>(HomeController(), permanent: false);
  }
}
