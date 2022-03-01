import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../CustomWidgets/bottom_button.dart';
import '../../../CustomWidgets/common_text_form_field.dart';
import '../../../Utilities/api_constants.dart';
import '../../../Utilities/app_colors.dart';
import '../../../Utilities/app_fonts.dart';
import '../../../Utilities/app_pages.dart';
import '../../../Utilities/size_config.dart';
import '../Controller/login_controller.dart';
import 'package:flutter/material.dart';



class LoginScreenView extends GetView<LoginController> {
  TextEditingController emailTextController =
  TextEditingController(text: "kobir.hossain@annanovas.com");
  TextEditingController passwordTextController =
  TextEditingController(text: "111111");

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            color: AppColors.appBackgroundColor,
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(114),
                ),
                Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(22)),
                    height: getProportionateScreenHeight(70),
                    child: Image.asset("assets/images/splash_logo.png")),
                SizedBox(
                  height: getProportionateScreenHeight(34),
                ),

                Container(
                  margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: CommonTextFormField(
                    hintText: "Enter email address",
                    labelText: "Email",
                    isReadOnlyEnable: false,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    fontFamily: AppFonts.robotoMonoText,
                    isSuffix: false,
                    suffixIcon: Icons.add,
                    textEditingController: emailTextController,
                    activeBorderColor: AppColors.textFieldBorder,
                    borderColor: AppColors.appBackground,
                    textSize: 14.0,
                    maxLine: 10,
                    context: context,
                    fontSize: 14,
                    width: 100,
                    height: 40,
                  ),
                ),

                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),

                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: CommonTextFormField(
                    hintText: "Enter Password",
                    labelText: "Password",
                    isReadOnlyEnable: false,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    fontFamily: AppFonts.robotoMonoText,
                    isSuffix: false,
                    suffixIcon: Icons.add,
                    textEditingController: passwordTextController,
                    activeBorderColor: AppColors.textFieldBorder,
                    borderColor: AppColors.appBackground,
                    textSize: 14.0,
                    maxLine: 10,
                    context: context,
                    fontSize: 14,
                    width: 100,
                    height: 40,
                  ),
                ),

                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                InkWell(
                    onTap: () {
                      Get.toNamed(Routes.FORGOT_PASSWORD);
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: AppColors.textFieldBorder,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: InkWell(
                      onTap: () {
                         Get.to(Routes.DASHBOARD);
                      },
                      child: BottomButton(
                          title: "LOGIN",
                          titleTextSize: 16,
                          iconName: "",
                          height: getProportionateScreenHeight(55),
                          width: double.infinity,
                          borderRadius: BorderRadius.circular(8.0),
                          context: context),
                    ))
              ],
            ),
          ),
        ));
        // Obx(() => controller.isLoading.value == false
        //     ? SingleChildScrollView(
        //   child: Container(
        //     width: double.infinity,
        //     color: AppColors.appBackgroundColor,
        //     child: Column(
        //       children: [
        //         SizedBox(
        //           height: getProportionateScreenHeight(114),
        //         ),
        //         Container(
        //             padding: EdgeInsets.symmetric(
        //                 horizontal: getProportionateScreenWidth(22)),
        //             height: getProportionateScreenHeight(70),
        //             child: Image.asset("assets/images/splash_logo.png")),
        //         SizedBox(
        //           height: getProportionateScreenHeight(34),
        //         ),
        //
        //         Container(
        //           margin: EdgeInsets.only(top: 40, left: 20, right: 20),
        //           child: CommonTextFormField(
        //             hintText: "Enter email address",
        //             labelText: "Email",
        //             isReadOnlyEnable: false,
        //             floatingLabelBehavior: FloatingLabelBehavior.always,
        //             textInputAction: TextInputAction.done,
        //             textInputType: TextInputType.text,
        //             fontFamily: AppFonts.robotoMonoText,
        //             isSuffix: false,
        //             suffixIcon: Icons.add,
        //             textEditingController: emailTextController,
        //             activeBorderColor: AppColors.textFieldBorder,
        //             borderColor: AppColors.appBackground,
        //             textSize: 14.0,
        //             maxLine: 10,
        //             context: context,
        //             fontSize: 14,
        //             width: 100,
        //             height: 40,
        //           ),
        //         ),
        //
        //         SizedBox(
        //           height: getProportionateScreenHeight(10),
        //         ),
        //
        //         Container(
        //           margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        //           child: CommonTextFormField(
        //             hintText: "Enter Password",
        //             labelText: "Password",
        //             isReadOnlyEnable: false,
        //             floatingLabelBehavior: FloatingLabelBehavior.always,
        //             textInputAction: TextInputAction.done,
        //             textInputType: TextInputType.text,
        //             fontFamily: AppFonts.robotoMonoText,
        //             isSuffix: false,
        //             suffixIcon: Icons.add,
        //             textEditingController: passwordTextController,
        //             activeBorderColor: AppColors.textFieldBorder,
        //             borderColor: AppColors.appBackground,
        //             textSize: 14.0,
        //             maxLine: 10,
        //             context: context,
        //             fontSize: 14,
        //             width: 100,
        //             height: 40,
        //           ),
        //         ),
        //
        //         SizedBox(
        //           height: getProportionateScreenHeight(15),
        //         ),
        //         InkWell(
        //             onTap: () {
        //               Get.toNamed(Routes.FORGOT_PASSWORD);
        //             },
        //             child: Text(
        //               "Forgot Password?",
        //               style: TextStyle(
        //                   color: AppColors.textFieldBorder,
        //                   fontSize: 16,
        //                   fontWeight: FontWeight.w500),
        //             )),
        //         SizedBox(
        //           height: getProportionateScreenHeight(15),
        //         ),
        //         Container(
        //             margin: EdgeInsets.symmetric(horizontal: 40),
        //             child: InkWell(
        //               onTap: () {
        //
        //                 // if (emailTextController.text.isEmpty) {
        //                 //   Utils().showToast(
        //                 //       "please_provide_your_email".tr, true);
        //                 // } else if (!Utils()
        //                 //     .checkEmail(emailTextController.text)) {
        //                 //   Utils().showToast(
        //                 //       "please_provide_a_valid_email_address".tr,
        //                 //       true);
        //                 // } else if (passwordTextController.text.isEmpty) {
        //                 //   Utils().showToast(
        //                 //       "please_provide_your_password".tr, true);
        //                 // } else {
        //                 //   Map<String, dynamic> bodyLogin = {
        //                 //     "authentication": APIConstants.AUTHENTICATION,
        //                 //     "email": emailTextController.text.trim(),
        //                 //     "password": passwordTextController.text.trim()
        //                 //   };
        //                 //   controller.login(bodyLogin);
        //                 // }
        //
        //                 // Get.toNamed(Routes.OTP_SCREEN, arguments: [
        //                 //   "01677006082",
        //                 // ]);
        //               },
        //               child: BottomButton(
        //                   title: "LOGIN",
        //                   titleTextSize: 16,
        //                   iconName: "",
        //                   height: getProportionateScreenHeight(55),
        //                   width: double.infinity,
        //                   borderRadius: BorderRadius.circular(8.0),
        //                   context: context),
        //             ))
        //       ],
        //     ),
        //   ),
        // )
        //     : Center(
        //   child: CircularProgressIndicator(),
        // )));
  }
}