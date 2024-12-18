import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tatari/app/controllers/auth_controller.dart';
import 'package:tatari/app/routes/app_routes.dart';
import 'package:tatari/app/ui/widgets/custom_text.dart';
import 'package:tatari/app/utils/helpers/extensions/extensions.dart';
import 'package:tatari/app/utils/helpers/getItHook/getit_hook.dart';

import '../../../../gen/assets.gen.dart';
import '../../../utils/constants/app_strings.dart';
import '../../widgets/common_auth_view.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_textfields.dart';

class LoginPage extends GetItHook<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    final passObscure = true.obs;

    return Form(
      child: FocusScope(
        child: CommonAuthView(
          banner: Assets.images.svg.icLoginBanner,
          title: AppStrings.T.welcomeBack,
          subtitle: AppStrings.T.pleaseSignInToContinue,
          onTap: () {
            Get.offAllNamed(AppRoutes.location);
          },
          rich1: AppStrings.T.dontHaveAnAccount,
          rich2: AppStrings.T.signUp,
          rich2onTap: () {
            Get.toNamed(AppRoutes.register);
          },
          buttonName: AppStrings.T.signIn,
          child: Column(
            children: [
              TextInputField(
                type: InputType.email,
                hintLabel: AppStrings.T.enterEmail,
                controller: controller.emailSignInController,
                // validator: AppValidations.emailValidation,
                prefixIcon: CustomImageView(imagePath: Assets.images.svg.icEmail),
              ),
              const Gap(16),
              Obx(() {
                return TextInputField(
                  type: InputType.password,
                  obscureText: passObscure,
                  textInputAction: TextInputAction.done,
                  hintLabel: AppStrings.T.enterPassword,
                  controller: controller.passwordSignInController,
                  prefixIcon: CustomImageView(imagePath: Assets.images.svg.icLock),
                );
              }),
              const Gap(10),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.forgotPassword);
                },
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: AppText(
                    AppStrings.T.forgotPassword,
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.primary,
                      decorationColor: colorScheme.primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              )
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
    controller.emailSignInController.clear();
    controller.passwordSignInController.clear();
  }

  @override
  void onDispose() {}
}
