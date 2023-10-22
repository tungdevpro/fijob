import 'dart:ui';

import 'package:flutter/material.dart';

class BlurBackgroundViewer extends StatelessWidget {
  final Widget page;
  final double blurIntensity;
  final double opacity;
  final Color? bgColor;
  final bool isDismissible;

  static const _defaultBackgroundOpacity = 0.5;
  static const _defaultBlurIntensity = 10.0;

  const BlurBackgroundViewer({
    Key? key,
    required this.page,
    this.blurIntensity = _defaultBlurIntensity,
    this.opacity = _defaultBackgroundOpacity,
    this.bgColor,
    this.isDismissible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Center(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: blurIntensity,
                sigmaY: blurIntensity,
              ),
              child: Container(),
            ),
          ),
        ),
        GestureDetector(
          onTap: isDismissible ? () => Navigator.of(context).pop() : null,
          child: Container(color: bgColor, child: page),
        ),
      ],
    );
  }
}
