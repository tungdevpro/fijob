import 'package:fijob/commons/constants/app_dimens.dart';
import 'package:fijob/commons/constants/app_typography.dart';
import 'package:fijob/commons/constants/asset/icon_resource.dart';
import 'package:fijob/commons/constants/color_constant.dart';
import 'package:fijob/presentation/auth/auth_constant.dart';
import 'package:fijob/presentation/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContinueWidth3rdParty extends StatelessWidget {
  const   ContinueWidth3rdParty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton.secondary(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset(IconResource.icGoogleSymbol1, width: 22),
              const SizedBox(width: AppDimension.padding),
              const Text(
                AuthConstant.googleLabel,
                style: TextStyle(fontSize: AppTypography.largeFs, fontWeight: FontWeight.w600, color: ColorConstants.gray100),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDimension.padding),
        CustomButton.secondary(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset(IconResource.icIconApple, width: 22),
              const SizedBox(width: AppDimension.padding),
              const Text(
                AuthConstant.appleLabel,
                style: TextStyle(fontSize: AppTypography.largeFs, fontWeight: FontWeight.w600, color: ColorConstants.gray100),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
