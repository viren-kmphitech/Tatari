import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tatari/app/controllers/auth_controller.dart';
import 'package:tatari/app/routes/app_routes.dart';
import 'package:tatari/app/ui/widgets/custom_image_view.dart';
import 'package:tatari/app/utils/constants/app_strings.dart';
import 'package:tatari/app/utils/helpers/getItHook/getit_hook.dart';

import '../../../../gen/assets.gen.dart';
import '../../widgets/common_auth_view.dart';
import '../../widgets/custom_textfields.dart';

class ForgotPasswordPage extends GetItHook<AuthController> {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return FocusScope(
      child: CommonAuthView(
        showBack: true,
        banner: Assets.images.svg.icForgotPasswordBanner,
        title: AppStrings.T.forgotPassword,
        subtitle: AppStrings.T.noWorries,
        onTap: () {
          Get.toNamed(
            AppRoutes.verifyCode,
            arguments: {"register": false},
          );
        },
        buttonName: AppStrings.T.sendCode,
        child: Column(
          children: [
            TextInputField(
              type: InputType.email,
              hintLabel: AppStrings.T.enterEmail,
              textInputAction: TextInputAction.done,
              controller: controller.emailForgotController,
              prefixIcon: CustomImageView(imagePath: Assets.images.svg.icEmail),
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
    // controller.forgotEmailController.clear();
  }

  @override
  void onDispose() {}
}
