import 'package:flutter/material.dart';

import '../Utilities/app_colors.dart';
import '../Utilities/app_fonts.dart';



class BottomButton extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double titleTextSize;
  final String iconName;
  final double height;
  final double width;
  final BorderRadius borderRadius;
  BuildContext context;

  BottomButton({
    required this.title,
    required this.titleTextSize,
    required this.iconName,
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.context,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buttonContainer();
  }

  Widget _buttonContainer() {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.textFieldBorder,
        borderRadius: borderRadius,

      ),
      child: Text(
        title,
        style: TextStyle(
          // fontFamily: AppFonts.geogrotesqueFont,
            color: AppColors.whiteTextColor,
            fontSize: titleTextSize,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5
        ),
      ),
    );
  }
}