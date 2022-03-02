

import 'package:get/get_navigation/src/routes/get_route.dart';

import '../Screens/Dashboard/Binding/dashboard_binding.dart';
import '../Screens/Dashboard/View/dashboard_screen_view.dart';
import '../Screens/Login/Binding/login_binding.dart';
import '../Screens/Login/View/login_screen_view.dart';
import '../Screens/SplashScreen/Binding/splash_screen_binding.dart';
import '../Screens/SplashScreen/View/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),

    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginScreenView(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardScreenView(),
      binding: DashboardBinding(),
    ),
    //
    // GetPage(
    //   name: _Paths.CHECK_IN,
    //   page: () => CheckInScreenView(),
    //   binding: CheckInBinding(),
    // ),
    //
    // GetPage(
    //   name: _Paths.DASHBOARD,
    //   page: () => DashboardView(),
    //   binding: DashboardBinding(),
    // ),
    //
    // GetPage(
    //   name: _Paths.MY_PROFILE,
    //   page: () => MyProfileScreen(),
    //   binding: MyProfileBinding(),
    // ),
    //
    // GetPage(
    //   name: _Paths.CHANGE_PASSWORD,
    //   page: () => ChangePasswordScreenView(),
    //   binding: ChangePasswordBinding(),
    // ),
    // GetPage(
    //   name: _Paths.FORGOT_PASSWORD,
    //   page: () => ForgotPasswordScreenView(),
    //   binding: ForgotPasswordBinding(),
    // ),
    //
    // GetPage(
    //   name: _Paths.OTP_SCREEN,
    //   page: () => OtpScreenView(),
    //   binding: OtpScreenBinding(),
    // ),
    //
    // GetPage(
    //   name: _Paths.RESET_PASSWORD,
    //   page: () => ResetPasswordScreenView(),
    //   binding: ResetPasswordBinding(),
    // ),
    //
    // GetPage(
    //   name: _Paths.EDIT_PROFILE,
    //   page: () => EditProfileScreen(),
    //   binding: EditProfileBinding(),
    // ),
  ];
}
