import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tatari/app/ui/widgets/custom_image_view.dart';
import 'package:tatari/app/ui/widgets/custom_text.dart';
import 'package:tatari/app/utils/constants/app_colors.dart';
import 'package:tatari/app/utils/constants/app_strings.dart';
import 'package:tatari/app/utils/helpers/extensions/extensions.dart';

import '../../utils/constants/app_edge_insets.dart';
import 'common_back_btn.dart';
import 'custom_button.dart';

class CommonAuthView extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final Widget? bannerWidget;
  final String buttonName, title, subtitle, banner;
  final String? rich1, rich2;
  final VoidCallback? rich2onTap, backPressed;
  final bool? showBack;

  const CommonAuthView({
    super.key,
    required this.onTap,
    required this.child,
    required this.buttonName,
    required this.title,
    required this.banner,
    required this.subtitle,
    this.rich1,
    this.showBack,
    this.backPressed,
    this.rich2,
    this.bannerWidget,
    this.rich2onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const AppEdgeInsets.h20(),
          child: Column(
            children: [
              bannerWidget ??
                  Padding(
                    padding: const AppEdgeInsets.onlyB50(),
                    child: Column(
                      children: [
                        const Gap(20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (showBack ?? false) CustomBackButton(onTap: backPressed) else const SizedBox(height: 40, width: 40),
                            // const Gap(30),
                            Padding(
                              padding: const AppEdgeInsets.onlyT30(),
                              child: CustomImageView(imagePath: banner, height: 140, fit: BoxFit.fill),
                            ),
                            const SizedBox(height: 40, width: 40),
                          ],
                        ),
                      ],
                    ),
                  ),
              AppText(title, style: textTheme.headlineLarge),
              CenterText(subtitle, style: textTheme.labelLarge),
              const Gap(30),
              child,
              title == AppStrings.T.createNewAccount ? const Gap(30) : const Gap(100),
              AppButton(title: buttonName, onTap: onTap),
              const Gap(20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: (rich1 ?? "") != "",
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: Center(
            child: AppRichText(
              spans: [
                AppSpan(
                  text: "${rich1 ?? ""} ",
                  style: textTheme.labelMedium?.copyWith(color: AppColors.greyTextColor2),
                ),
                AppSpan(
                  text: rich2 ?? "",
                  recognizer: TapGestureRecognizer()..onTap = rich2onTap ?? () {},
                  style: textTheme.labelMedium?.copyWith(color: AppColors.primaryColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
