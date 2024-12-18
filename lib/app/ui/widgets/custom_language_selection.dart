import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/utils.dart';
import 'package:tatari/app/ui/widgets/custom_image_view.dart';
import 'package:tatari/app/utils/helpers/extensions/extensions.dart';

import '../../../gen/assets.gen.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_strings.dart';
import 'custom_text.dart';

class CustomLanguageSelection extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const CustomLanguageSelection({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 168,
        height: 140,
        child: Stack(
          children: [
            CustomImageView(
              imagePath: selected ? Assets.images.svg.icLanguageSelected : Assets.images.svg.icLanguageUnselected,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: "English" == title ? Assets.images.png.icEnglish.path : Assets.images.png.icAmharic.path,
                    height: 50,
                    width: 50,
                    fit: BoxFit.fill,
                  ),
                  const Gap(10),
                  AppText(
                    title,
                    style: textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomProfileSelection extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const CustomProfileSelection({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 260,
        margin: EdgeInsets.only(
          top: !(title == AppStrings.T.user) ? 105 : 0,
          bottom: title == AppStrings.T.user ? 105 : 0,
        ),
        child: Stack(
          children: [
            CustomImageView(
              imagePath: selected ? Assets.images.svg.icProfileTypeSelected : Assets.images.svg.icProfileTypeUnselected,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 96,
                    width: 96,
                    child: Stack(
                      children: [
                        CustomImageView(
                          imagePath: Assets.images.svg.icPolygon,
                          height: 96,
                          width: 96,
                          color: selected ? colorScheme.onPrimary : AppColors.greyTextColor1,
                        ),
                        Positioned(
                          child: Center(
                            child: CustomImageView(
                              imagePath: title == AppStrings.T.user ? Assets.images.svg.icProfile : Assets.images.svg.icJob,
                              height: 42,
                              width: 42,
                              color: selected ? colorScheme.onSecondary : colorScheme.secondaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),
                  AppText(
                    title,
                    style: textTheme.headlineSmall?.copyWith(color: selected ? colorScheme.onPrimary : colorScheme.onSecondary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
