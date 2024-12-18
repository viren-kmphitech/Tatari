import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tatari/app/controllers/auth_controller.dart';
import 'package:tatari/app/routes/app_routes.dart';
import 'package:tatari/app/ui/widgets/common_auth_view.dart';
import 'package:tatari/app/ui/widgets/common_bottom_sheet.dart';
import 'package:tatari/app/ui/widgets/custom_image_view.dart';
import 'package:tatari/app/utils/constants/app_edge_insets.dart';
import 'package:tatari/app/utils/constants/app_strings.dart';
import 'package:tatari/app/utils/helpers/extensions/extensions.dart';
import 'package:tatari/app/utils/helpers/getItHook/getit_hook.dart';

import '../../../../gen/assets.gen.dart';
import '../../../utils/constants/app_border_radius.dart';
import '../../../utils/constants/app_colors.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfields.dart';

class RegisterPage extends GetItHook<AuthController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    final passObscure = true.obs;
    final confirmPassObscure = true.obs;

    return Form(
      child: FocusScope(
        child: CommonAuthView(
          bannerWidget: Column(
            children: [
              const Gap(20),
              Stack(
                children: [
                  Padding(
                    padding: const AppEdgeInsets.onlyB8(),
                    child: ClipRRect(
                      borderRadius: const AppBorderRadius.all120(),
                      child: SizedBox(
                        width: 120,
                        height: 120,
                        child: CustomImageView(imagePath: Assets.images.png.icDummy1.path),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 5,
                    child: GestureDetector(
                      onTap: () {
                        openSheet(child: const ImageUpload());
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          border: Border.all(color: colorScheme.onPrimary, width: 2.5),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: SizedBox(
                          width: 36,
                          height: 36,
                          child: Padding(
                            padding: const AppEdgeInsets.all10(),
                            child: CustomImageView(
                              imagePath: Assets.images.svg.icCamera,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(20),
            ],
          ),
          banner: Assets.images.svg.icResetPasswordBanner,
          title: AppStrings.T.createNewAccount,
          subtitle: AppStrings.T.enterYourDetailsBelow,
          onTap: () {
            Get.toNamed(
              AppRoutes.verifyCode,
              arguments: {"register": true},
            );
          },
          rich2onTap: () {
            Get.back();
          },
          buttonName: AppStrings.T.register,
          rich1: AppStrings.T.alreadyHaveAnAccount,
          rich2: AppStrings.T.signIn,
          child: Column(
            children: [
              TextInputField(
                prefixIcon: CustomImageView(imagePath: Assets.images.svg.icUser),
                type: InputType.name,
                controller: controller.firstNameSignUpController,
                hintLabel: AppStrings.T.enterYourFirstName,
              ),
              const Gap(16),
              TextInputField(
                prefixIcon: CustomImageView(imagePath: Assets.images.svg.icUser),
                type: InputType.name,
                controller: controller.lastNameSignUpController,
                hintLabel: AppStrings.T.enterYourLastName,
              ),
              const Gap(16),
              TextInputField(
                prefixIcon: CustomImageView(imagePath: Assets.images.svg.icEmail),
                type: InputType.name,
                controller: controller.emailSignUpController,
                hintLabel: AppStrings.T.enterYourEmail,
              ),
              const Gap(16),
              TextInputField(
                prefixIcon: CustomImageView(imagePath: Assets.images.svg.icCall),
                type: InputType.name,
                controller: controller.phoneNumberSignUpController,
                hintLabel: AppStrings.T.enterYourPhoneNumber,
              ),
              const Gap(16),
              Obx(() {
                return TextInputField(
                  prefixIcon: CustomImageView(imagePath: Assets.images.svg.icLock),
                  type: InputType.name,
                  obscureText: passObscure,
                  controller: controller.passwordSignUpController,
                  hintLabel: AppStrings.T.enterYourPassword,
                );
              }),
              const Gap(16),
              Obx(() {
                return TextInputField(
                  prefixIcon: CustomImageView(imagePath: Assets.images.svg.icLock),
                  type: InputType.name,
                  obscureText: confirmPassObscure,
                  controller: controller.confirmPasswordSignUpController,
                  hintLabel: AppStrings.T.enterYourConfirmPassword,
                );
              }),
              const Gap(16),
              Row(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: colorScheme.secondaryContainer),
                      borderRadius: const AppBorderRadius.all8(),
                    ),
                    child: const SizedBox(
                      height: 24,
                      width: 24,
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: AppRichText(
                      textAlign: TextAlign.left,
                      spans: [
                        AppSpan(
                          text: "${AppStrings.T.iAgreeTo} ",
                          style: textTheme.labelMedium?.copyWith(color: AppColors.greyTextColor2),
                        ),
                        AppSpan(
                          text: AppStrings.T.privacyPolicy,
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: textTheme.labelMedium?.copyWith(
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor: colorScheme.primary,
                          ),
                        ),
                        AppSpan(
                          text: " ${AppStrings.T.and} ",
                          style: textTheme.labelMedium?.copyWith(color: AppColors.greyTextColor2),
                        ),
                        AppSpan(
                          text: AppStrings.T.termsConditions,
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: textTheme.labelMedium?.copyWith(
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor: colorScheme.primary,
                          ),
                        ),
                        AppSpan(
                          text: ".",
                          style: textTheme.labelMedium?.copyWith(color: AppColors.greyTextColor2),
                        ),
                      ],
                    ),
                  ),
                ],
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
    // controller
    //   ..nameController.clear()
    //   ..registerEmailController.clear()
    //   ..registerPassController.clear()
    //   ..phoneNumberController.clear();
  }

  @override
  void onDispose() {}
}
