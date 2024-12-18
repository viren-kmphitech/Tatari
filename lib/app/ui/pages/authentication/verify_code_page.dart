import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:tatari/app/controllers/auth_controller.dart';
import 'package:tatari/app/utils/helpers/extensions/extensions.dart';
import 'package:tatari/app/utils/helpers/getItHook/getit_hook.dart';
import 'package:tatari/gen/assets.gen.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_strings.dart';
import '../../widgets/common_auth_view.dart';
import '../../widgets/common_bottom_sheet.dart';

class VerifyCodePage extends GetItHook<AuthController> {
  const VerifyCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final theme = context.textTheme;
    final colorScheme = context.colorScheme;

    final defaultPinTheme = PinTheme(
      width: 70,
      height: 56,
      margin: const EdgeInsets.only(left: 2, right: 2),
      textStyle: theme.headlineMedium?.copyWith(fontWeight: FontWeight.w500),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderColor, width: 1.5),
      ),
    );
    final focusedPinTheme = PinTheme(
      width: 70,
      height: 56,
      margin: const EdgeInsets.only(left: 2, right: 2),
      textStyle: theme.headlineMedium,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colorScheme.primary, width: 1.5),
      ),
    );

    return FocusScope(
      child: CommonAuthView(
        showBack: true,
        banner: Assets.images.svg.icForgotPasswordBanner,
        title: AppStrings.T.verification,
        subtitle: AppStrings.T.enterTheVerificationCode,
        onTap: () {
          if (controller.isRegisterFlow.value) {
            openSheet(
              canPop: false,
              child: CommonBottomSheet(
                title: AppStrings.T.congratulations,
                subtitle: AppStrings.T.youHaveSuccessfully,
                image: Assets.images.svg.icCongratulations,
                btnName: AppStrings.T.ok,
                onTap: () {
                  Get.offAllNamed(AppRoutes.location);
                },
              ),
            );
          } else {
            Get.toNamed(AppRoutes.resetPassword);
          }
        },
        rich1: AppStrings.T.didntReceiveTheCode,
        rich2: AppStrings.T.resend,
        rich2onTap: () {
          controller.otpController.clear();
        },
        buttonName: AppStrings.T.verify,
        child: Column(
          children: [
            Center(
              child: Pinput(
                length: 4,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: focusedPinTheme,
                controller: controller.otpController,
                onCompleted: print,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get canDisposeController => false;

  @override
  void onInit() {
    debugPrint(":----> ${Get.arguments["register"]}");
    controller.onOTPInit(Get.arguments["register"]);
    controller.otpController.clear();
  }

  @override
  void onDispose() {}
}
