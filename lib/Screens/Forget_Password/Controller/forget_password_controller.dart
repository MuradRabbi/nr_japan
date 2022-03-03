import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../Utilities/app_pages.dart';
import '../Provider/forget_password_provider.dart';





class ForgotPasswordController extends GetxController{

 var isLoading = false.obs;
 final localStorage = GetStorage();


 @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
 forgotPassword(Map<String, dynamic>body) async{
  print("===================Forgot Password Api Call=================");
  try{
   isLoading.value = true;
   update();
   await ForgotPasswordProvider().forgotPasswordRequest(body).then((value){

    if( value != null ){
     log("forgotPasswordRequest ${value}");
     log("forgotPasswordRequest ${value.token}");
     Get.toNamed(Routes.OTP_SCREEN, arguments: [
      value,
     ]);
    }
   });
  }catch(e){
   isLoading.value = false;
   update();
  }
}
}