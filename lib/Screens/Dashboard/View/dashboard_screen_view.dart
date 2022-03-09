import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../CustomWidgets/no_internet_connection.dart';
import '../../../Models/attendence_model.dart';
import '../../../NavigationDrawer/navigation_drawer.dart';
import '../../../NetworkCheck/my_connectivity.dart';
import '../../../Utilities/app_colors.dart';
import '../../../Utilities/app_fonts.dart';
import '../../../Utilities/shared_perf_keys.dart';
import '../../../Utilities/size_config.dart';
import '../Controller/dashboard_controller.dart';


class DashboardScreenView extends StatefulWidget {
  @override
  _DashboardScreenViewState createState() => _DashboardScreenViewState();
}

class _DashboardScreenViewState extends State<DashboardScreenView>
    with AutomaticKeepAliveClientMixin {
  final DashboardController dashboardController = Get.put(DashboardController());

  bool isOnline = true;
  Map _source = {ConnectivityResult.wifi: true};
  final MyConnectivity _connectivity = MyConnectivity.instance;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState

    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      if (mounted) {
        setState(() => _source = source);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    switch (_source.keys.toList()[0]) {
      case ConnectivityResult.mobile:
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

    return isOnline
        ? Scaffold(
        drawer: NavigationDrawer(),
        appBar: customAppBar(),
        backgroundColor: AppColors.appBackgroundColor,
        body: RefreshIndicator(
          onRefresh: _refreshData,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                child: Obx(() =>
                dashboardController.isLoading.value == false
                    ? Container(
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

                      // dashboardController.todaysCheckinResponseModel.value.data!
                      //     .alreadyCheckout == true ? todayStatusSection(
                      //     dashboardController.todaysCheckinResponseModel.value.data!
                      //         .attendances) :
                      // dashboardController.todaysCheckinResponseModel.value.data!
                      //     .alreadyCheckin ==
                      //     true
                      //     ? checkOutButton(context)
                      //     : checkInButton(),
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
                                "${dashboardController.localStorage.read(LocalStorageKeys
                                    .checkInText)}",
                                style: TextStyle(
                                    color: AppColors.blackTextColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
                    : Center(
                  child: CircularProgressIndicator(),
                )),
              )
            ],
          ),
        ))
        : Scaffold(body: NoInternetConnection());
  }

  Future<void> _refreshData() async {
    print('refreshing data...');
    // dashboardController.todaysCheckInRequest();
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
      onTap: () async {
        // dashboardController.permissionServiceCall();
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

  InkWell checkOutButton(BuildContext context) {
    return InkWell(
      onTap: () async {
        _showCheckOutDialog(context);
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

  todayStatusSection(Attendances? attendances) {
    return Container(
      child: Column(
        children: [

          Container(
            height: getProportionateScreenHeight(100),
            width: MediaQuery
                .of(context)
                .size
                .width,
            color: AppColors.skyBlueColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Today Date", textScaleFactor: 1.0,
                  style: TextStyle(color: AppColors.blackTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.robotoSlabText),),
                SizedBox(height: getProportionateScreenHeight(8),),
                Text("${attendances!.checkDate}", textScaleFactor: 1.0,
                  style: TextStyle(color: AppColors.blackTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppFonts.robotoSlabText),),
              ],
            ),
          ),

          Container(
            height: getProportionateScreenHeight(100),
            width: MediaQuery
                .of(context)
                .size
                .width,
            color: AppColors.skyBlueColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Check In Time", textScaleFactor: 1.0,
                  style: TextStyle(color: AppColors.blackTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      fontFamily: AppFonts.robotoSlabText),),
                SizedBox(height: getProportionateScreenHeight(8),),
                Text("${attendances!.checkInTime}", textScaleFactor: 1.0,
                  style: TextStyle(color: AppColors.blackTextColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      fontFamily: AppFonts.robotoSlabText),),
              ],
            ),
          ),

          Container(
            height: getProportionateScreenHeight(100),
            width: MediaQuery
                .of(context)
                .size
                .width,
            color: AppColors.skyBlueColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Check Out Time", textScaleFactor: 1.0,
                  style: TextStyle(color: AppColors.blackTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      fontFamily: AppFonts.robotoSlabText),),
                SizedBox(height: getProportionateScreenHeight(8),),
                Text("${attendances!.checkOutTime}", textScaleFactor: 1.0,
                  style: TextStyle(color: AppColors.blackTextColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      fontFamily: AppFonts.robotoSlabText),),
              ],
            ),
          )

        ],
      ),
    );
  }


  _showCheckOutDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("Check Out"),
            content: Text("Are you sure to check out"),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text("No"),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
              ),
              CupertinoDialogAction(
                child: Text(
                  "Check Out",
                  style: TextStyle(color: AppColors.homePageRedButtonColor),
                ),
                onPressed: () async {
                  Navigator.of(context, rootNavigator: true).pop();
                  // await dashboardController.checkoutRequest(dashboardController.todaysCheckinResponseModel.value.data!.attendances);
                },
              ),
            ],
          );
        });
  }
}
