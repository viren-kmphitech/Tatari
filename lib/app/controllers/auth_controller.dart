import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart' as i;

void _disposeAuthController(AuthController instance) {
  instance.dispose();
}

@i.LazySingleton(dispose: _disposeAuthController)
@i.injectable
class AuthController extends GetxController {
  ///
  RxBool selectedAmLanguage = false.obs;
  onLanguageChanged(bool value) {
    selectedAmLanguage.value = value;
  }

  ///
  RxBool selectedSP = false.obs;
  onSelectedSPChange(bool value) {
    selectedSP.value = value;
  }

  /// LOGIN
  final emailSignInController = TextEditingController();
  final passwordSignInController = TextEditingController();

  /// FORGOT
  final emailForgotController = TextEditingController();

  /// OTP
  final otpController = TextEditingController();
  RxBool isRegisterFlow = false.obs;
  onOTPInit(bool val) {
    isRegisterFlow.value = val;
  }

  /// REGISTER
  final firstNameSignUpController = TextEditingController();
  final lastNameSignUpController = TextEditingController();
  final emailSignUpController = TextEditingController();
  final phoneNumberSignUpController = TextEditingController();
  final passwordSignUpController = TextEditingController();
  final confirmPasswordSignUpController = TextEditingController();

  /// RESET PASSWORD
  final passwordResetController = TextEditingController();
  final confirmPasswordResetController = TextEditingController();
}
