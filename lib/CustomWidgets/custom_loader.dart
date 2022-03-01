
import 'package:flutter/material.dart';

import '../Utilities/app_colors.dart';
import '../Utilities/app_fonts.dart';

class CustomLoader extends StatefulWidget {
  final String title;
  CustomLoader({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  _CustomLoader createState() => _CustomLoader();
}

class _CustomLoader extends State<CustomLoader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.2),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Container(
            height: 180.0,
            width: 250.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: Text("${widget.title}",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors.homePageDeepGreyButtonColor,
                        fontFamily: AppFonts.robotoMonoText,
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