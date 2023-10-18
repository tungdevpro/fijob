import 'package:fijob/core/storage/hive_client_primitive_factory.dart';
import 'package:fijob/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yh_basic/core/app/app_cubit.dart';
import 'package:yh_basic/core/app/app_info.dart';

import '../../../commons/constants/asset/image_resource.dart';
import '../../../commons/constants/color_constant.dart';

class InitialContent extends StatefulWidget {
  const InitialContent({super.key});

  @override
  State<InitialContent> createState() => _InitialContentState();
}

class _InitialContentState extends State<InitialContent> {
  @override
  void initState() {
    // context.read<AppCubit>().handleSkipGettingStarted();
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
                  Image.asset(ImageResource.imgSplash, width: 100),
                  Text("data: ${state.skipGettingStarted}"),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
