import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nr_japan/Screens/Forget_Password/Controller/forget_password_controller.dart';

import '../../../CustomWidgets/bottom_button.dart';
import '../../../CustomWidgets/common_text_form_field.dart';
import '../../../CustomWidgets/no_internet_connection.dart';
import '../../../NetworkCheck/my_connectivity.dart';
import '../../../Utilities/app_colors.dart';
import '../../../Utilities/app_fonts.dart';
import '../../../Utilities/shared_perf_keys.dart';
import '../../../Utilities/size_config.dart';




class ForgotPasswordScreenView extends StatefulWidget {
  const ForgotPasswordScreenView({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenViewState createState() => _ForgotPasswordScreenViewState();
}

class _ForgotPasswordScreenViewState extends State<ForgotPasswordScreenView> with AutomaticKeepAliveClientMixin {

  final ForgotPasswordController controller = Get.put(ForgotPasswordController());

  TextEditingController emailTextController = TextEditingController(text: "kobir.hossain@annanovas.com");

  final localStorage = GetStorage();

  bool isOnline = true;
  Map _source = {ConnectivityResult.wifi: true};
  final MyConnectivity _connectivity = MyConnectivity.instance;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    switch (_source.keys.toList()[0]){
      case ConnectivityResult.mobile :
        isOnline = true;
        break;
      case ConnectivityResult.wifi:
        isOnline = true;
        break;
      case ConnectivityResult.none:
        isOnline = false;
        break;
      default:
        isOnline = true;
    }
    return isOnline ?  Scaffold(
        // drawer: NavigationDrawer(),
        appBar: customAppBar(),
        backgroundColor: AppColors.appBackgroundColor,
        body: Obx(() => controller.isLoading.value == false
            ? Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Text(
                  "${localStorage.read(LocalStorageKeys.forgotPasswordText)}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.facebookBlue,
                      fontFamily: AppFonts.robotoSlabText),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                child: CommonTextFormField(
                  labelText: "Enter Your Email",
                  hintText: "Your Email Address",
                  isReadOnlyEnable: false,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                  fontFamily: AppFonts.robotoMonoText,
                  isSuffix: false,
                  suffixIcon: Icons.add,
                  textEditingController: emailTextController,
                  activeBorderColor: AppColors.appBackground,
                  borderColor: AppColors.appBackground,
                  textSize: 14.0,
                  maxLine: 10,
                  context: context,
                  fontSize: 14,
                  width: 100,
                  height: 60,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: InkWell(
                    onTap: () {

                    },
                    child: BottomButton(
                        title: "SUBMIT",
                        titleTextSize: 14,
                        iconName: "",
                        height: getProportionateScreenHeight(50),
                        width: double.infinity,
                        borderRadius: BorderRadius.circular(8.0),
                        context: context),
                  ))
            ],
          ),
        )
            : Center(
          child: CircularProgressIndicator(),
        ))) : Scaffold(body: NoInternetConnection());
  }

  AppBar customAppBar() {
    return AppBar(
      backgroundColor: AppColors.textFieldBorder,
      leading: Builder(
        builder: (context) => InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            padding: EdgeInsets.only(top: 18, bottom: 18),
            height: 15,
            width: 15,
            child: Icon(Icons.arrow_back, color: AppColors.orangeTextColor,),
          ),
        ),
      ),
      title: Text(
        "FORGOT PASSWORD",
        style: TextStyle(
            color: AppColors.orangeTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  InkWell checkInButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: getProportionateScreenHeight(120),
        width: getProportionateScreenWidth(160),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.textFieldBorder,
                AppColors.gradientLightBlueColor
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(8.0)),
        child: Container(
          // height: getProportionateScreenHeight(110),
          // width: getProportionateScreenWidth(150),
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: AppColors.orangeTextColor, width: 1.8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: getProportionateScreenHeight(35),
                width: getProportionateScreenWidth(100),
                child: Image.asset("assets/icons/orange-arrow.png"),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Text(
                "CHECK IN",
                style: TextStyle(
                    color: AppColors.orangeTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
