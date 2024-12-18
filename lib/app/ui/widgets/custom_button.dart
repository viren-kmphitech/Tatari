// Placeholder for custom_button.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tatari/app/ui/widgets/custom_text.dart';
import 'package:tatari/app/utils/constants/app_edge_insets.dart';
import 'package:tatari/app/utils/helpers/extensions/extensions.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (FocusScope.of(context).isFirstFocus) {
          FocusScope.of(context).unfocus();
        }
        Get.back();
      },
      child: Container(
        padding: const AppEdgeInsets.all8(),
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: color ?? context.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
        // child: CustomImageView(
        //   imagePath: Assets.images.svg.icArrowBack,
        //   width: 20,
        //   height: 20,
        // ),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton({
    required this.title,
    this.titleFontWeight,
    this.fillColor,
    this.titleColor,
    this.titleFontSize,
    this.suffixGap,
    this.prefixGap,
    this.titleTextStyle,
    this.height,
    this.boxShadow = true,
    this.textAlign,
    this.width,
    required this.onTap,
    this.radius,
    this.prefix,
    this.suffix,
    super.key,
    this.horizontalPadding,
    this.verticalPadding,
    this.borderColor,
    this.strokeWidth,
  });

  final String? title;
  final Color? fillColor;
  final Color? borderColor;
  final void Function()? onTap;
  final double? radius;
  final TextAlign? textAlign;
  final TextStyle? titleTextStyle;
  final Color? titleColor;
  final FontWeight? titleFontWeight;
  final double? titleFontSize;
  final double? height;
  final bool boxShadow;
  final double? width;
  final double? suffixGap;
  final double? prefixGap;
  final double? strokeWidth;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Widget? prefix;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? BtnDefaults.height,
        width: width ?? BtnDefaults.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: fillColor ?? context.colorScheme.primary,
          borderRadius: BorderRadius.circular(radius ?? BtnDefaults.radius),
          boxShadow: boxShadow
              ? [
                  BoxShadow(
                    color: (fillColor ?? const Color(0xFFCBE6FF)).withOpacity(0.95),
                    spreadRadius: 0,
                    offset: const Offset(0, 6),
                    blurRadius: 20,
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: AppText(
                title!,
                style: titleTextStyle ??
                    context.textTheme.bodyLarge?.copyWith(
                      fontWeight: titleFontWeight ?? FontWeight.w600,
                      color: titleColor ?? context.colorScheme.onPrimaryFixed,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BtnDefaults {
  BtnDefaults._();

  static const height = 56.0;
  static const width = double.infinity;
  static const radius = 8.0;
}
