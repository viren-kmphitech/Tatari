import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tatari/app/controllers/auth_controller.dart';
import 'package:tatari/app/ui/widgets/common_auth_view.dart';
import 'package:tatari/app/ui/widgets/common_bottom_sheet.dart';
import 'package:tatari/app/ui/widgets/custom_image_view.dart';
import 'package:tatari/app/ui/widgets/custom_textfields.dart';
import 'package:tatari/app/utils/constants/app_strings.dart';
import 'package:tatari/app/utils/helpers/getItHook/getit_hook.dart';

import '../../../../gen/assets.gen.dart';
import '../../../routes/app_routes.dart';

class ResetPasswordPage extends GetItHook<AuthController> {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final passObscure = false.obs;
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        Get.offNamedUntil(
          AppRoutes.forgotPassword,
          ModalRoute.withName(AppRoutes.profileType),
        );
      },
      child: FocusScope(
        child: CommonAuthView(
          showBack: true,
          backPressed: () {
            Get.offNamedUntil(
              AppRoutes.forgotPassword,
              ModalRoute.withName(AppRoutes.profileType),
            );
          },
          banner: Assets.images.svg.icResetPasswordBanner,
          title: AppStrings.T.resetPassword,
          subtitle: AppStrings.T.yourNewPasswordMust,
          onTap: () {
            openSheet(
              canPop: false,
              child: CommonBottomSheet(
                title: AppStrings.T.passwordUpdated,
                subtitle: AppStrings.T.congratulationsYouUpdated,
                image: Assets.images.svg.icSuccess,
                btnName: AppStrings.T.ok,
                onTap: () {
                  // Get.offAllNamed(AppRoutes.location);
                  Get.offNamedUntil(
                    AppRoutes.login,
                    ModalRoute.withName(AppRoutes.profileType),
                  );
                },
              ),
            );
          },
          buttonName: AppStrings.T.update,
          child: Column(
            children: [
              const Gap(16),
              Obx(() {
                return TextInputField(
                  type: InputType.password,
                  obscureText: passObscure,
                  hintLabel: AppStrings.T.enterPassword,
                  controller: controller.passwordResetController,
                  // validator: AppValidations.passwordValidation,
                  prefixIcon: CustomImageView(imagePath: Assets.images.svg.icLock),
                );
              }),
              const Gap(16),
              Obx(() {
                return TextInputField(
                  type: InputType.password,
                  obscureText: passObscure,
                  textInputAction: TextInputAction.done,
                  hintLabel: AppStrings.T.enterConfirmPpassword,
                  controller: controller.confirmPasswordResetController,
                  // validator: AppValidations.passwordValidation,
                  prefixIcon: CustomImageView(imagePath: Assets.images.svg.icLock),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get canDisposeController => false;

  @override
  void onInit() {
    // controller
    //   ..resetPassController.clear()
    //   ..confirmPassController.clear();
  }

  @override
  void onDispose() {}
}
