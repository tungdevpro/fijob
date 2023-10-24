import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../commons/constants/app_dimens.dart';
import '../../../commons/constants/app_typography.dart';
import '../../../commons/constants/color_constant.dart';
import '../auth_constant.dart';

class AuthTermsConditionBottom extends StatelessWidget {
  const AuthTermsConditionBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: AppDimension.maxPadding + 18).copyWith(bottom: AppDimension.paddingSM),
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: const TextStyle(color: ColorConstants.gray60, fontWeight: FontWeight.w600, fontSize: AppTypography.mediumFs),
          children: <TextSpan>[
            TextSpan(text: '${AuthConstant.termsCondition[0]} '),
            TextSpan(text: AuthConstant.termsCondition[1], style: const TextStyle(color: ColorConstants.primary), recognizer: TapGestureRecognizer()..onTap = () => _onTapTerm()),
            TextSpan(text: ' ${AuthConstant.termsCondition[2]} '),
            TextSpan(text: AuthConstant.termsCondition[3], style: const TextStyle(color: ColorConstants.primary), recognizer: TapGestureRecognizer()..onTap = () => _onTapCondition()),
          ],
        ),
      ),
    );
  }

  void _onTapTerm() {}

  void _onTapCondition() {}
}
