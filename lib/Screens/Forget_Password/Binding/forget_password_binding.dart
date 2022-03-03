import 'package:get/get.dart';
import 'package:nr_japan/Screens/Forget_Password/Controller/forget_password_controller.dart';



class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(
            () => ForgotPasswordController());
  }

}