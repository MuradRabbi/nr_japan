import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:nr_japan/Screens/Dashboard/Controller/dashboard_controller.dart';
import 'package:flutter/material.dart';

import '../../../Utilities/app_colors.dart';
import '../../../Utilities/size_config.dart';

class DashboardScreenView extends GetView<DashboardController> {


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        appBar: customAppBar(),
        body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              checkInButton(),
              Spacer(),
              Container(
                height: getProportionateScreenHeight(55),
                color: AppColors.skyBlueColor,
                child: Row(
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                    Container(
                      height: getProportionateScreenHeight(30),
                      width: getProportionateScreenHeight(30),
                      child:
                      Image.asset("assets/images/info-icon.png"),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(15),
                    ),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 80,
                      child: Text(
                        "Text",
                        // "${dashboardController.localStorage.read(LocalStorageKeys
                        //     .checkInText)}",
                        style: TextStyle(
                            color: AppColors.blackTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        )

    );

  }

  AppBar customAppBar() {
    return AppBar(
      backgroundColor: AppColors.textFieldBorder,
      leading: Builder(
        builder: (context) =>
            InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Container(
                padding: EdgeInsets.only(top: 18, bottom: 18),
                height: 15,
                width: 15,
                child: Image.asset("assets/images/drawer-icon.png"),
              ),
            ),
      ),
      title: Text(
        "DASHBOARD",
        style: TextStyle(
            color: AppColors.orangeTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w600),
      ),
    );
  }


  InkWell checkInButton() {
    return InkWell(
      onTap: () {
      },
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
                child: Image.asset("assets/images/checkin-arrow.png"),
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

  InkWell checkOutButton(BuildContext context) {
    return InkWell(
      onTap: () async {
        // _showCheckOutDialog(context);
      },
      child: Container(
        height: getProportionateScreenHeight(120),
        width: getProportionateScreenWidth(160),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.textFieldBorder,
                AppColors.textFieldBorder
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
              border: Border.all(color: AppColors.warningColor, width: 1.8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: getProportionateScreenHeight(35),
                width: getProportionateScreenWidth(100),
                child: Image.asset("assets/icons/checkout.png"),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Text(
                "CHECK OUT",
                style: TextStyle(
                    color: AppColors.warningColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// class DashboardView extends StatefulWidget {
//   @override
//   _DashboardViewState createState() => _DashboardViewState();
// }
//
// class _DashboardViewState extends State<DashboardView>
//     with AutomaticKeepAliveClientMixin {
//   final DashboardController dashboardController = Get.put(DashboardController());
//
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       backgroundColor: AppColors.appBackgroundColor,
//       appBar: customAppBar(),
//       body:  ,
//     );
//   }
//
//   Future<void> _refreshData() async {
//     print('refreshing data...');
//     // dashboardController.todaysCheckInRequest();
//   }
//
//
//
//
//
//
//
// }
