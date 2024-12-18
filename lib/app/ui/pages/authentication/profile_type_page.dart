import 'package:gap/gap.dart';
import 'package:tatari/app/controllers/auth_controller.dart';
import 'package:tatari/app/ui/widgets/custom_language_selection.dart';
import 'package:tatari/app/ui/widgets/custom_text.dart';
import 'package:tatari/app/utils/helpers/exporter.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/helpers/getItHook/getit_hook.dart';
import '../../widgets/custom_button.dart';

class ProfileTypePage extends GetItHook<AuthController> {
  const ProfileTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const Gap(50),
            CenterText(
              AppStrings.T.getStartedWithTatari,
              style: context.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w400),
            ),
            const Gap(72),
            Obx(
              () => Row(
                children: [
                  Expanded(
                    child: CustomProfileSelection(
                      title: AppStrings.T.user,
                      onTap: () => controller.onSelectedSPChange(false),
                      selected: !controller.selectedSP.value,
                    ),
                  ),
                  const Gap(15),
                  Expanded(
                    child: CustomProfileSelection(
                      title: AppStrings.T.serviceProvider,
                      onTap: () => controller.onSelectedSPChange(true),
                      selected: controller.selectedSP.value,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(100),
            AppButton(
              title: AppStrings.T.continueBtn,
              onTap: () {
                Future.delayed(
                  const Duration(milliseconds: 200),
                  () {
                    Get.toNamed(AppRoutes.login);
                  },
                );
              },
            )
          ],
        ),
      ).marginSymmetric(horizontal: 20),
    );
  }

  @override
  bool get canDisposeController => false;

  @override
  void onDispose() {}

  @override
  void onInit() {}
}
