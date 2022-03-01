

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class Utils {
  void showToast(String message, bool isError) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: isError ? Colors.red[900] : Colors.grey[700],
        textColor: Colors.white,
        fontSize: 16.0);
  }

  bool checkEmail(String email) {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    return emailValid;
  }

  Widget builtItemImageContainer(String? imageName) {
    String imageUrl = "";

    if (imageName != null && imageName.length > 0) {
      imageUrl = "$imageName";
    }

    bool _validURL = Uri.parse(imageUrl).isAbsolute;

    try {
      return Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(0),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: (_validURL && imageUrl.length > 0)
                ? CachedNetworkImage(
              imageUrl: imageUrl,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              placeholder: (context, url) => Container(
                  padding: EdgeInsets.all(0),
                  child: Center(child: CupertinoActivityIndicator())),
              errorWidget: (context, url, error) => Container(
                  height: 25,
                  width: 25,
                  margin: EdgeInsets.all(0),
                  child: Image.asset("assets/icons/my_profile_placeholder.png")),
            )
                : Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(2),
                ),
                border: Border(
                  top:
                  BorderSide(width: 1.0, color: AppColors.whiteTextColor),
                  left:
                  BorderSide(width: 1.0, color: AppColors.whiteTextColor),
                  right:
                  BorderSide(width: 1.0, color: AppColors.whiteTextColor),
                  bottom:
                  BorderSide(width: 1.0, color: AppColors.whiteTextColor),
                ),
                image: DecorationImage(
                    image: AssetImage("assets/icons/my_profile_placeholder.png"),
                    fit: BoxFit.contain),
              ),
            ),
          ));
    } catch (error) {
      print("error : $error");
      return Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(2),
          ),
          border: Border(
            top: BorderSide(width: 1.0, color: AppColors.whiteTextColor),
            left: BorderSide(width: 1.0, color: AppColors.whiteTextColor),
            right: BorderSide(width: 1.0, color: AppColors.whiteTextColor),
            bottom: BorderSide(width: 1.0, color: AppColors.whiteTextColor),
          ),
          image: DecorationImage(
              image: AssetImage("assets/icons/my_profile_placeholder.png"),
              fit: BoxFit.contain),
        ),
      );
    }
  }

}