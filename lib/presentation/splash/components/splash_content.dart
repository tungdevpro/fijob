import 'package:fijob/presentation/getting_started/getting_started_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yh_basic/core/app/app_cubit.dart';
import 'package:yh_basic/core/app/app_info.dart';

import '../../../commons/constants/asset/image_resource.dart';
import '../../../commons/constants/color_constant.dart';

class SplashContent extends StatefulWidget {
  const SplashContent({super.key});

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primary,
      body: SafeArea(
        child: BlocBuilder<AppCubit, AppInfo>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GettingStartedPage()));
                      // context.push(RoutePath.gettingStarted);
                    },
                    child: Image.asset(ImageResource.imgSplash, width: 100),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}