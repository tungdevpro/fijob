import 'package:fijob/commons/constants/app_dimens.dart';
import 'package:fijob/commons/constants/color_constant.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final String? errorText;

  const CustomInputField({super.key, this.prefixIcon, this.hintText, this.suffixIcon, this.onChanged, this.errorText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorConstants.gray70,
      cursorWidth: 1,
      onChanged: (value) => onChanged?.call(value),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: ColorConstants.gray70, fontSize: 14),
        suffixIcon: Padding(padding: const EdgeInsets.all(13), child: suffixIcon),
        prefixIcon: Padding(padding: const EdgeInsets.all(13), child: prefixIcon),
        errorText: errorText,
        border: OutlineInputBorder(
            borderSide: const BorderSide(width: .5, color: ColorConstants.line), borderRadius: BorderRadius.circular(AppDimension.radius)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: .5, color: ColorConstants.line), borderRadius: BorderRadius.circular(AppDimension.radius)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: .5, color: ColorConstants.line), borderRadius: BorderRadius.circular(AppDimension.radius)),
      ),
    );
  }
}
