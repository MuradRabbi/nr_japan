import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../Utilities/size_config.dart';
import '../Controller/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  final SplashScreenController controller= Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(22)),
            height: getProportionateScreenHeight(85),
            child: Image.asset("assets/images/splash_logo.png")
        ),
      ),
    );
  }
}