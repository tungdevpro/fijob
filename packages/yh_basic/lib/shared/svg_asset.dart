import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAsset extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final BoxFit fit;
  const SvgAsset({super.key, required this.assetName, this.width, this.height, this.fit = BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(assetName, width: width, height: height, fit: fit);
  }
}
