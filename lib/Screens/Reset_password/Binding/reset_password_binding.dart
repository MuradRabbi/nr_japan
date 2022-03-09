import 'package:get/get.dart';
import 'package:nr_japan/Screens/Reset_password/Controller/reset_password_controller.dart';

class ResetPasswordBonding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPasswordController());
  }

}