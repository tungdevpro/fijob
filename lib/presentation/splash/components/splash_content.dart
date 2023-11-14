import 'package:fijob/presentation/getting_started/getting_started_page.dart';
import 'package:fijob/presentation/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yh_basic/yh_basic.dart';

import '../../../commons/constants/asset/image_resource.dart';
import '../../../commons/constants/color_constant.dart';

class SplashContent extends StatefulWidget {
  const SplashContent({super.key});

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends BaseStateView<SplashContent, SplashBloc> {
  @override
  SplashBloc get initBloc => SplashBloc.to;

  @override
  Widget buildChild() {
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
