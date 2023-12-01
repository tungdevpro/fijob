import 'package:fijob/commons/constants/app_dimens.dart';
import 'package:fijob/commons/constants/color_constant.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final dynamic label;
  final TextEditingController? controller;
  final bool readOnly;
  final bool enabled;
  final VoidCallback? onTap;

  const CustomInputField({
    super.key,
    this.prefixIcon,
    this.hintText,
    this.suffixIcon,
    this.onChanged,
    this.errorText,
    this.label,
    this.controller,
    this.readOnly = false,
    this.enabled = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          label is Widget
              ? label
              : Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(label, style: const TextStyle(fontWeight: FontWeight.w500, color: ColorConstants.gray100)),
                ),
        TextFormField(
          controller: controller,
          cursorColor: ColorConstants.gray70,
          cursorWidth: 1,
          onChanged: (value) => onChanged?.call(value),
          onTap: onTap,
          readOnly: readOnly,
          enabled: enabled,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: ColorConstants.gray70, fontSize: 16),
            suffixIcon: Padding(padding: const EdgeInsets.all(13), child: suffixIcon),
            prefixIcon: Padding(padding: const EdgeInsets.all(13), child: prefixIcon),
            errorText: errorText,
            border: OutlineInputBorder(
                borderSide: const BorderSide(width: .5, color: ColorConstants.line),
                borderRadius: BorderRadius.circular(Dimensions.radius)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: .5, color: ColorConstants.line),
                borderRadius: BorderRadius.circular(Dimensions.radius)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: .5, color: ColorConstants.line),
                borderRadius: BorderRadius.circular(Dimensions.radius)),
          ),
        ),
      ],
    );
  }
}
