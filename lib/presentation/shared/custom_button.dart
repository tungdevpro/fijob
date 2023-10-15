import 'package:fijob/commons/constants/app_dimens.dart';
import 'package:fijob/commons/constants/app_typography.dart';
import 'package:fijob/commons/constants/color_constant.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final dynamic title;
  final VoidCallback? onTap;
  final Color bgColor;
  final Color fontColor;
  final double fontSize;
  final Color? borderColor;
  const CustomButton({
    super.key,
    this.onTap,
    this.title,
    this.bgColor = ColorConstants.primary,
    this.fontColor = ColorConstants.white,
    this.fontSize = AppTypography.mediumFs,
    this.borderColor,
  });

  factory CustomButton.secondary({dynamic title, VoidCallback? onTap, double? fontSize}) {
    return CustomButton(
        onTap: onTap,
        title: Text(title, style: TextStyle(color: ColorConstants.gray100, fontSize: fontSize, fontWeight: FontWeight.w600)),
        bgColor: Colors.white,
        borderColor: ColorConstants.gray100);
  }

  factory CustomButton.disable({dynamic title, VoidCallback? onTap, double? fontSize}) {
    return CustomButton(
        onTap: onTap,
        title: Text(title, style: TextStyle(color: ColorConstants.gray60, fontSize: fontSize, fontWeight: FontWeight.w600)),
        bgColor: ColorConstants.gray60,
        borderColor: ColorConstants.gray60);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(bgColor),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.radius), side: BorderSide(color: borderColor ?? bgColor)))),
      child: title is Widget ? title : Text(title, style: TextStyle(color: fontColor, fontSize: fontSize, fontWeight: FontWeight.w600)),
    );
  }
}
