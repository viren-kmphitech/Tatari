import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tatari/app/utils/helpers/extensions/extensions.dart';

import '../../../gen/assets.gen.dart';
import '../../utils/constants/app_border_radius.dart';
import '../../utils/constants/app_colors.dart';
import 'custom_image_view.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onTap;

  const CustomBackButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return GestureDetector(
      onTap: onTap ?? () => Get.back(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const AppBorderRadius.all8(),
          border: Border.all(color: AppColors.greyTextColor3),
        ),
        child: SizedBox(
          height: 40,
          width: 40,
          child: Center(
            child: CustomImageView(
              imagePath: Assets.images.svg.icArrowLeft,
              color: colorScheme.onSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
