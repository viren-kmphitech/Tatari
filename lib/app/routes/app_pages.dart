import 'package:get/get.dart';
import 'package:tatari/app/routes/app_routes.dart';
import 'package:tatari/app/ui/pages/authentication/language_page.dart';
import 'package:tatari/app/ui/pages/authentication/login_page.dart';
import 'package:tatari/app/ui/pages/authentication/profile_type_page.dart';
import 'package:tatari/app/ui/pages/location/enable_location_view.dart';
import 'package:tatari/app/ui/pages/splash/splash_page.dart';

import '../ui/pages/authentication/forgot_password_page.dart';
import '../ui/pages/authentication/register_page.dart';
import '../ui/pages/authentication/reset_password_page.dart';
import '../ui/pages/authentication/verify_code_page.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashPage()),
    GetPage(name: AppRoutes.language, page: () => const LanguagePage()),
    GetPage(name: AppRoutes.profileType, page: () => const ProfileTypePage()),

    // AUTH
    GetPage(name: AppRoutes.login, page: () => const LoginPage()),
    GetPage(name: AppRoutes.register, page: () => const RegisterPage()),
    GetPage(name: AppRoutes.forgotPassword, page: () => const ForgotPasswordPage()),
    GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCodePage()),
    GetPage(name: AppRoutes.resetPassword, page: () => const ResetPasswordPage()),

    //
    GetPage(name: AppRoutes.location, page: () => const EnableLocationView()),
  ];
}
