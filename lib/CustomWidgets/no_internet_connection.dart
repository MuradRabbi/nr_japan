
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../Utilities/app_colors.dart';
import '../Utilities/app_fonts.dart';
import '../Utilities/size_config.dart';

class NoInternetConnection extends StatefulWidget {
  NoInternetConnection({
    Key? key,
  }) : super(key: key);

  @override
  _NoInternetConnectionState createState() => _NoInternetConnectionState();
}

class _NoInternetConnectionState extends State<NoInternetConnection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white.withOpacity(.5),
      body: Center(
        child: Container(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: getProportionateScreenHeight(150),
                  width: getProportionateScreenWidth(150),
                  child: Image.asset("assets/icons/splash_logo.png"),
                ),
                SizedBox(
                    child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColors.textFieldBorder))
                ),

                SizedBox(
                  height: 25,
                ),
                Container(
                  child: Text("No Internet Connection",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20,
                        color: AppColors.textFieldBorder,
                        fontFamily: AppFonts.geogrotesque,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text("Please Connect To The Internet And Try Again",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.textFieldBorder,
                        fontFamily: AppFonts.geogrotesque,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}