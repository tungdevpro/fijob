import 'package:fijob/commons/constants/asset/image_resource.dart';
import 'package:fijob/commons/constants/color_constant.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primary,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Image.asset(ImageResource.imgSplash, width: 100)],
          ),
        ),
      ),
    );
  }
}
