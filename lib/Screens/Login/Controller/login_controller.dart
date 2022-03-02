import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nr_japan/Screens/Login/Provider/login_provider.dart';
import 'package:nr_japan/Utilities/shared_perf_keys.dart';
import '../../../Utilities/app_pages.dart';






class LoginController extends GetxController {

  final localStorage = GetStorage();
  var isLoading = false.obs;
  var hidePassword = true.obs;


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  passwordHide() {
    hidePassword.value = !hidePassword.value;
    update();
  }


  login(Map<String, dynamic>body)async{

    print("=================== Login API Call===================");

    try{
      isLoading.value = true;
      update();
      await LoginProvider().phoneLogin(body).then((value){
          if(value != null){
            log("${value.token}");
            localStorage.write(LocalStorageKeys.apiToken , value.token);
            Get.offAllNamed(Routes.DASHBOARD);
          }else{
            Fluttertoast.showToast(
                msg: "Something is wrong",
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.black,
                fontSize: 14.0,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_LONG,
            );
          }
      });

    } catch(e){
      print(e);
    } finally{
      isLoading.value == false;
      update();
    }

  }

}