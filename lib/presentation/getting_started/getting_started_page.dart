import 'package:fijob/commons/constants/app_dimens.dart';
import 'package:fijob/commons/constants/app_typography.dart';
import 'package:fijob/presentation/getting_started/bloc/getting_started_cubit.dart';
import 'package:fijob/presentation/getting_started/components/dot_comp.dart';
import 'package:fijob/presentation/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yh_basic/utils/duration_provider.dart';

import '../../commons/constants/color_constant.dart';
import 'getting_started_constants.dart';

class GettingStartedPage extends StatefulWidget {
  const GettingStartedPage({super.key});

  @override
  State<GettingStartedPage> createState() => _GettingStartedPageState();
}

class _GettingStartedPageState extends State<GettingStartedPage> {
  final GettingStartedCubit _cubit = GettingStartedCubit();

  @override
  void initState() {
    _cubit.setContext(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GettingStartedCubit>.value(
      value: _cubit,
      child: Scaffold(
        backgroundColor: ColorConstants.primary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimension.paddingXXL),
            child: ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                BlocBuilder<GettingStartedCubit, int>(
                  builder: (context, state) {
                    return AspectRatio(
                      aspectRatio: .8,
                      child: AnimatedSwitcher(
                        duration: const ShortDuration(),
                        transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child),
                        child: Image.asset(_cubit.resource[state - 1].asset, key: ValueKey<String>(_cubit.resource[state - 1].asset)),
                      ),
                    );
                  },
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppDimension.paddingXXL),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(AppDimension.radiusLG)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BlocBuilder<GettingStartedCubit, int>(
                        builder: (context, state) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AnimatedSwitcher(
                                duration: const MediumDuration(),
                                transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child),
                                child: RichText(
                                  key: ValueKey<List<String>>(_cubit.resource[state - 1].title),
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: const TextStyle(color: ColorConstants.gray100, fontSize: AppTypography.maxLargeFs, fontWeight: FontWeight.w700),
                                    children: [
                                      TextSpan(text: _cubit.resource[state - 1].title.first),
                                      TextSpan(text: " ${_cubit.resource[state - 1].title.last}", style: const TextStyle(color: ColorConstants.primary)),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              AnimatedSwitcher(
                                duration: const ShortDuration(),
                                transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child),
                                child: Text(_cubit.resource[state - 1].content,
                                    key: ValueKey<String>(_cubit.resource[state - 1].content),
                                    style: const TextStyle(color: ColorConstants.gray60, height: 1.5, fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: AppDimension.paddingXXL),
                      const DotComp(),
                      const SizedBox(height: AppDimension.paddingXXL),
                      CustomButton(
                        onTap: () => _cubit.nextStep(),
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: AppDimension.padding, horizontal: AppDimension.maxPadding),
                          child: BlocBuilder<GettingStartedCubit, int>(
                            builder: (context, state) {
                              return Text(
                                state == _cubit.totalStep ? GettingStartedConstants.btnEnd : GettingStartedConstants.btnNext,
                                style: const TextStyle(fontSize: AppTypography.largeFs, fontWeight: FontWeight.w600, color: Colors.white),
                              );
                            },
                          ),
                        ),
                        fontSize: AppTypography.largeFs,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
