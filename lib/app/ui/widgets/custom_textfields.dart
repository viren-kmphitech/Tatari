import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tatari/app/ui/widgets/custom_image_view.dart';

import '../../../gen/assets.gen.dart';

class _SuffixIcon extends StatelessWidget {
  const _SuffixIcon({
    required this.showing,
  });

  final RxBool showing;

  @override
  Widget build(BuildContext context) {
    /// If you have to change the suffixIcon widget so you must have to be change you icon here.
    return GestureDetector(
      onTap: showing.toggle,
      child: CustomImageView(imagePath: showing.value ? Assets.images.svg.icEye : Assets.images.svg.icEyeSlash),
    );
  }
}

class TextInputField extends TextFormField {
  TextInputField({
    super.key,
    required InputType type,
    required String hintLabel,
    required super.controller,
    super.textInputAction = TextInputAction.next,
    super.maxLines,
    super.minLines,
    super.autovalidateMode = AutovalidateMode.onUnfocus,
    super.validator,
    super.enabled,
    super.readOnly,
    super.expands,
    RxBool? obscureText,
    super.obscuringCharacter,
    TextInputType? keyboardType,
    Iterable<String>? autoFillHints,
    Widget? suffixIcon,
    Widget? prefixIcon,
    List<TextInputFormatter>? inputFormatters,
  })  : assert(type != InputType.multiline || textInputAction == TextInputAction.newline, 'Make textInputAction = TextInputAction.newline'),
        assert(
          (type != InputType.password && type != InputType.newPassword && type != InputType.confirmPassword) || obscureText != null,
          'Make sure your providing obscureText and Wrap Obx on TextInputField',
        ),
        super(
          keyboardType: keyboardType ??
              switch (type) {
                InputType.name => TextInputType.name,
                InputType.text => TextInputType.text,
                InputType.email => TextInputType.emailAddress,
                InputType.password => TextInputType.visiblePassword,
                InputType.confirmPassword => TextInputType.visiblePassword,
                InputType.newPassword => TextInputType.visiblePassword,
                InputType.phoneNumber => TextInputType.phone,
                InputType.digits => TextInputType.number,
                InputType.decimalDigits => const TextInputType.numberWithOptions(decimal: true),
                InputType.multiline => TextInputType.multiline,
              },
          autofillHints: [
            if (autoFillHints != null) ...autoFillHints,
            switch (type) {
              InputType.name => AutofillHints.name,
              InputType.email => AutofillHints.email,
              InputType.password => AutofillHints.password,
              InputType.confirmPassword => AutofillHints.password,
              InputType.newPassword => AutofillHints.newPassword,
              InputType.phoneNumber => AutofillHints.telephoneNumber,
              _ => '',
            },
          ],
          inputFormatters: [
            if (inputFormatters != null) ...inputFormatters,
            if (type == InputType.digits) FilteringTextInputFormatter.digitsOnly,
            if (type == InputType.decimalDigits) FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
          ],
          style: Get.context?.textTheme.labelMedium,
          obscureText: obscureText?.value ?? false,
          // onTapOutside: (_) => FocusScope.of(Get.context!).unfocus(),
          decoration: InputDecoration(
            hintText: hintLabel,
            prefixIcon: prefixIcon != null ? Center(child: prefixIcon) : null,
            prefixIconConstraints: BoxConstraints.tight(const Size.square(50)),
            suffixIconConstraints: BoxConstraints.tight(const Size.square(50)),
            suffixIcon: suffixIcon ??
                (obscureText == null
                    ? null
                    : Builder(
                        builder: (context) {
                          return Center(
                            child: _SuffixIcon(
                              showing: obscureText,
                            ),
                          );
                        },
                      )),
          ),
        );
}

enum InputType {
  name,
  text,
  email,
  password,
  confirmPassword,
  newPassword,
  phoneNumber,
  digits,
  decimalDigits,
  multiline,
}
