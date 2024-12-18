import 'dart:ui';

import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tatari/app/utils/helpers/extensions/extensions.dart';

import '../../../gen/assets.gen.dart';
import '../../utils/constants/app_border_radius.dart';
import '../../utils/helpers/exporter.dart';
import 'custom_button.dart';
import 'custom_image_view.dart';
import 'custom_text.dart';
import 'image_pick_service.dart';

openSheet({
  required Widget child,
  bool? canPop,
}) {
  Get.bottomSheet(
    isDismissible: canPop ?? true,
    PopScope(
      canPop: canPop ?? true,
      child: child,
    ),
  );
}

class CommonBottomSheet extends StatelessWidget {
  final String title, subtitle, image, btnName;

  final VoidCallback onTap;

  const CommonBottomSheet({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.btnName,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: AppBorderRadius.top20(),
        ),
        child: Padding(
          padding: const AppEdgeInsets.all20(),
          child: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImageView(imagePath: image),
                const Gap(15),
                AppText(
                  title,
                  style: textTheme.headlineMedium,
                ),
                const Gap(5),
                CenterText(
                  subtitle,
                  style: textTheme.labelMedium,
                ),
                const Gap(30),
                AppButton(
                  title: btnName,
                  onTap: () {
                    onTap();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImageUpload extends StatelessWidget {
  const ImageUpload({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: AppBorderRadius.top20(),
        ),
        child: Padding(
          padding: const AppEdgeInsets.all20(),
          child: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(
                  AppStrings.T.uploadYourImage,
                  style: textTheme.headlineSmall,
                ),
                const Gap(20),
                Container(
                  height: 1,
                  width: Get.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.borderColor.withOpacity(0.2),
                        AppColors.borderColor,
                        AppColors.borderColor.withOpacity(0.2),
                      ],
                    ),
                  ),
                ),
                const Gap(24),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          ImagePickService().pickImage(source: ImageSource.camera);
                        },
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            color: AppColors.primaryColorFA,
                            borderRadius: AppBorderRadius.all10(),
                          ),
                          child: SizedBox(
                            width: 140,
                            height: 142,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: colorScheme.onPrimary,
                                    borderRadius: const AppBorderRadius.all120(),
                                  ),
                                  child: SizedBox(
                                    height: 70,
                                    width: 70,
                                    child: Center(
                                      child: CustomImageView(
                                        imagePath: Assets.images.svg.icCamera,
                                        height: 35,
                                        width: 35,
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(10),
                                AppText(
                                  AppStrings.T.camera,
                                  style: textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Gap(16),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          ImagePickService().pickImage(source: ImageSource.gallery);
                        },
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            color: AppColors.primaryColorFA,
                            borderRadius: AppBorderRadius.all10(),
                          ),
                          child: SizedBox(
                            width: 140,
                            height: 142,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: colorScheme.onPrimary,
                                    borderRadius: const AppBorderRadius.all120(),
                                  ),
                                  child: SizedBox(
                                    height: 70,
                                    width: 70,
                                    child: Center(
                                      child: CustomImageView(
                                        imagePath: Assets.images.svg.icGallery,
                                        height: 35,
                                        width: 35,
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(10),
                                AppText(
                                  AppStrings.T.gallery,
                                  style: textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(24),
                AppButton(
                  title: AppStrings.T.cancel,
                  onTap: Get.back,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
