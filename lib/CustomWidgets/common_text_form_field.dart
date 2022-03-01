import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utilities/app_colors.dart';

class CommonTextFormField extends StatelessWidget
    implements PreferredSizeWidget {
  final String hintText;
  final String labelText;
  final double fontSize;
  final bool isReadOnlyEnable;
  final FloatingLabelBehavior floatingLabelBehavior;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final String fontFamily;
  final Color activeBorderColor;
  final Color borderColor;
  final double textSize;
  final int maxLine;
  final bool isSuffix;
  final IconData suffixIcon;
  final TextEditingController textEditingController;
  final double height;
  final double width;
  BuildContext context;

  CommonTextFormField({
    required this.hintText,
    required this.labelText,
    required this.fontSize,
    required this.isReadOnlyEnable,
    required this.floatingLabelBehavior,
    required this.textInputAction,
    required this.textInputType,
    required this.fontFamily,
    required this.activeBorderColor,
    required this.borderColor,
    required this.textSize,
    required this.maxLine,
    required this.isSuffix,
    required this.suffixIcon,
    required this.textEditingController,
    required this.height,
    required this.width,
    required this.context,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _textFieldContainer();
  }

  Widget _textFieldContainer() {
    return Container(
      child: TextFormField(
          readOnly: isReadOnlyEnable,
          controller: textEditingController,
          keyboardType: textInputType,
          maxLines: maxLine,
          minLines: 1,
          textInputAction: textInputAction,
          decoration: InputDecoration(
              floatingLabelBehavior: floatingLabelBehavior,
              isDense: true,
              hintText: hintText,
              hintStyle: TextStyle(
                  color: AppColors.textFieldBorder,
                  fontSize: fontSize,
                  fontFamily: fontFamily),
              labelText: labelText,
              alignLabelWithHint: true,
              labelStyle: TextStyle(
                  color: AppColors.textFieldBorder,
                  fontWeight: FontWeight.normal,
                  fontSize: fontSize,
                  fontFamily: fontFamily),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 1.0),
              ),
              // prefixIcon: Icon(Icons.add),
              suffixIcon: isSuffix
                  ? Icon(suffixIcon, size: 20, color: AppColors.textFieldBorder)
                  : null,
              focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: activeBorderColor, width: 1.0)))),
    );
  }
}
