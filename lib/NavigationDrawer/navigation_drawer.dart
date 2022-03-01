// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:package_info_plus/package_info_plus.dart';
//
// import '../Utilities/app_colors.dart';
// import '../Utilities/app_fonts.dart';
// import '../Utilities/app_pages.dart';
// import '../Utilities/utils.dart';
//
// class NavigationDrawer extends StatefulWidget {
//   NavigationDrawer({Key? key}) : super(key: key);
//
//   @override
//   _NavigationDrawer createState() => _NavigationDrawer();
// }
//
// class _NavigationDrawer extends State<NavigationDrawer>
//     with WidgetsBindingObserver {
//   String nameTextHolder = "";
//   String phoneTextHolder = "";
//   String userImage = "";
//   int imagePlaceholderId = 0;
//   // Users users = Users();
//
//   final localStorage = GetStorage();
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchProfileData();
//     _fetchAppInfo();
//   }
//
//   // _setUserData(Users user){
//   //   if(user!=null){
//   //     nameTextHolder = user.name!;
//   //     phoneTextHolder = user.phone!;
//   //     userImage = user.image;
//   //   }
//
//     if(mounted){
//       setState(() {
//
//       });
//     }
//   }
//
//   String version = "";
//   String buildNumber = '';
//
//   _fetchAppInfo() async {
//     print("_fetchUserData");
//     PackageInfo packageInfo = await PackageInfo.fromPlatform();
//
//     version = packageInfo.version;
//     buildNumber = packageInfo.buildNumber;
//     setState(() {});
//   }
//
//   Future<Null> _logOutFromSocial() async {}
//
//   String _getValue(String value) {
//     if (value != null && !value.contains("null")) {
//       return value;
//     }
//
//     return "";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: Drawer(
//         child: Column(
//           children: [
//             Container(
//                 width: SizeConfig.screenWidth,
//                 color: AppColors.appBackgroundColor,
//                 child: createDrawerHeader()),
//             Expanded(
//               child: ListView(
//                 shrinkWrap: true,
//                 padding: EdgeInsets.zero,
//                 children: <Widget>[
//                   InkWell(
//                       onTap: () {
//                         Get.toNamed(Routes.MY_PROFILE);
//                       },
//                       child: _buildMyAccountItem(
//                           "MY PROFILE",
//                           AppColors.textFieldBorder,
//                           "assets/icons/forward_arrow.png")),
//                   InkWell(
//                       onTap: () {
//                         Get.toNamed(Routes.CHANGE_PASSWORD);
//                       },
//                       child: _buildMyAccountItem(
//                           "CHANGE PASSWORD",
//                           AppColors.textFieldBorder,
//                           "assets/icons/forward_arrow.png")),
//                   InkWell(
//                       onTap: () {
//                         _showLogoutDialog(context);
//                       },
//                       child: _buildMyAccountItem("LOG OUT",
//                           AppColors.warningColor, "assets/icons/logout.png")),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// This widget for Nav drawer Header ///
//   Widget createDrawerHeader() {
//     return DrawerHeader(
//         margin: EdgeInsets.zero,
//         padding: EdgeInsets.zero,
//         child: GestureDetector(
//           onTap: () {
//             Navigator.of(context).pop();
//             Get.toNamed(Routes.MY_PROFILE);
//
//             // if (User.isLoggedIn) {
//             //   Navigator.push(
//             //     context,
//             //     MaterialPageRoute(builder: (context) => EditPersonalInfoScreen()),
//             //   );
//             // } else {
//             //   Navigator.push(
//             //     context,
//             //     MaterialPageRoute(
//             //         builder: (context) => LoginScreen(
//             //           didSuccessfullyLoggedIn: () {},
//             //         )),
//             //   );
//             // }
//           },
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Column(
//                 children: [
//                   Container(
//                     height: 60,
//                     width: 60,
//                     decoration: new BoxDecoration(
//                       color: AppColors.white,
//                       borderRadius: BorderRadius.circular(65),
//                       border: Border.all(width: 1, color: Colors.grey),
//                     ),
//                     child: ClipRRect(
//                         borderRadius: BorderRadius.circular(65),
//                         child: Utils().builtItemImageContainer("${localStorage.read(LocalStorageKeys.cdnUrl)}/$userImage")),
//
//                     // Image.asset("assets/images/icon-profileNew.png"),
//                   ),
//                   SizedBox(height: 10),
//                   (nameTextHolder.isNotEmpty &&
//                       !nameTextHolder
//                           .toString()
//                           .toLowerCase()
//                           .contains('null'))
//                       ? Text(
//                     nameTextHolder.toUpperCase(),
//                     style: TextStyle(
//                         color: AppColors.textFieldBorder,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: AppFonts.robotoSlabText,
//                         fontSize: 16.0),
//                   )
//                       : Container(),
//                   SizedBox(
//                     height: 3,
//                   ),
//                   (phoneTextHolder.isNotEmpty &&
//                       !phoneTextHolder
//                           .toString()
//                           .toLowerCase()
//                           .contains('null'))
//                       ? Text(
//                     phoneTextHolder.toUpperCase(),
//                     style: TextStyle(
//                         color: AppColors.textFieldBorder,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: AppFonts.robotoSlabText,
//                         fontSize: 12.0),
//                   )
//                       : Container(),
//                   SizedBox(
//                     height: 5,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ));
//   }
//
//   /// This is used for Drawer Item ///
//   Widget _buildMyAccountItem(String name, Color textColor, String iconLink) {
//     return Container(
//         margin: EdgeInsets.only(left: 25, right: 25),
//         child: Column(children: <Widget>[
//           SizedBox(
//             height: 15,
//           ),
//           Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Container(
//                     height: 24,
//                     margin: EdgeInsets.only(top: 5),
//                     child: Center(
//                       child: Text(name,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               fontSize: 16,
//                               color: textColor,
//                               fontFamily: AppFonts.robotoSlabText,
//                               fontWeight: FontWeight.bold)),
//                     )),
//                 Expanded(child: Container()),
//                 Container(
//                   height: getProportionateScreenHeight(15),
//                   width: getProportionateScreenHeight(15),
//                   child: Image.asset(iconLink),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Container(height: .5, color: AppColors.textFieldBorder)
//         ]));
//   }
//
//   _showLogoutDialog(BuildContext context) {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return CupertinoAlertDialog(
//             title: Text("Logout"),
//             content: Text("Are you sure to logout"),
//             actions: <Widget>[
//               CupertinoDialogAction(
//                 child: Text("No"),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               CupertinoDialogAction(
//                 child: Text(
//                   "Logout",
//                   style: TextStyle(color: AppColors.homePageRedButtonColor),
//                 ),
//                 onPressed: () async {
//                   await logoutUser();
//                   localStorage.erase();
//                   Navigator.of(context).pop();
//                   // Get.offAndToNamed('/signin');
//                   Get.offAllNamed(Routes.SIGNIN);
//
//                   // getProfileDeleteRequest();
//                 },
//               ),
//             ],
//           );
//         });
//   }
//
//   _fetchProfileData() async {
//     Map<String, dynamic> parameters = Map<String, dynamic>();
//     parameters["authentication"] = APIConstants.AUTHENTICATION;
//     ResponseObject responseObject =
//     await repository.profileDetailsRequest(parameters);
//
//     switch (responseObject.id) {
//       case ResponseCode.SUCCESSFUL:
//
//         users = responseObject.object as Users;
//         _setUserData(users);
//
//         break;
//       case ResponseCode.FAILED:
//         break;
//       case ResponseCode.AUTHORIZATION_FAILED:
//         break;
//     }
//   }
//
//   logoutUser() async {
//     ResponseObject responseObject = await repository.logoutRequest();
//
//     switch (responseObject.id) {
//       case ResponseCode.SUCCESSFUL:
//         break;
//       case ResponseCode.FAILED:
//         break;
//     }
//   }
// }
