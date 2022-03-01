import 'package:get/get.dart';
import '../Controller/splash_screen_controller.dart';


class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(
          () => SplashScreenController(),
    );
  }
}