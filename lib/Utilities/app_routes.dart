

part of 'app_pages.dart';
abstract class Routes {
  Routes._();
  static const SPLASH_SCREEN = _Paths.SPLASH_SCREEN;
  static const CHECK_IN = _Paths.CHECK_IN;
  static const OFFERS = _Paths.OFFERS;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const SIGNUP = _Paths.SIGNUP;
  static const LOGIN = _Paths.LOGIN;
  static const MY_PROFILE = _Paths.MY_PROFILE;
  static const CHANGE_PASSWORD = _Paths.CHANGE_PASSWORD;
  static const FORGOT_PASSWORD = _Paths.FORGOT_PASSWORD;
  static const OTP_SCREEN = _Paths.OTP_SCREEN;
  static const RESET_PASSWORD = _Paths.RESET_PASSWORD;
  static const EDIT_PROFILE = _Paths.EDIT_PROFILE;

}

abstract class _Paths {
  static const SPLASH_SCREEN = '/splash-screen';
  static const  CHECK_IN= '/check-in';
  static const OFFERS = '/offers';
  static const  DASHBOARD= '/dashboard';
  static const SIGNUP = '/signup';
  static const LOGIN = '/login';
  static const MY_PROFILE = '/my_profile';
  static const CHANGE_PASSWORD = '/change_password';
  static const FORGOT_PASSWORD = '/forgot_password';
  static const OTP_SCREEN = '/otp_screen';
  static const RESET_PASSWORD = '/reset_password';
  static const EDIT_PROFILE = '/edit_profile';

}