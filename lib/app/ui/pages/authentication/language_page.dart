import 'package:flutter/services.dart';
import 'package:tatari/app/ui/widgets/common_auth_view.dart';
import 'package:tatari/app/ui/widgets/custom_language_selection.dart';
import 'package:tatari/app/utils/helpers/getItHook/getit_hook.dart';

import '../../../../gen/assets.gen.dart';
import '../../../controllers/auth_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/helpers/exporter.dart';

class LanguagePage extends GetItHook<AuthController> {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.black,
        statusBarColor: AppColors.transparent,
      ),
    );
    return CommonAuthView(
      banner: Assets.images.svg.icLanguageBanner,
      title: AppStrings.T.chooseLanguage,
      subtitle: AppStrings.T.selectYourPreferred,
      onTap: () {
        Get.toNamed(AppRoutes.profileType);
      },
      buttonName: AppStrings.T.continueBtn,
      child: Obx(() {
        return Row(
          children: [
            Expanded(
              child: CustomLanguageSelection(
                title: AppStrings.T.english,
                onTap: () => controller.onLanguageChanged(false),
                selected: !controller.selectedAmLanguage.value,
              ),
            ),
            Expanded(
              child: CustomLanguageSelection(
                title: AppStrings.T.amharic,
                onTap: () => controller.onLanguageChanged(true),
                selected: controller.selectedAmLanguage.value,
              ),
            ),
          ],
        );
      }),
    );
  }

  @override
  bool get canDisposeController => false;

  @override
  void onDispose() {}

  @override
  void onInit() {}
}
