import 'package:fijob/commons/constants/app_dimens.dart';
import 'package:fijob/commons/constants/color_constant.dart';
import 'package:fijob/presentation/getting_started/blocs/getting_started_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DotComp extends StatelessWidget {
  const DotComp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GettingStartedCubit, int>(
      builder: (context, state) {
        int cur = state - 1;
        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List<Widget>.generate(
            context.watch<GettingStartedCubit>().totalStep,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: cur == index ? 32 : 12,
              height: 12,
              margin: const EdgeInsets.only(right: 10),
              decoration:
                  BoxDecoration(color: cur == index ? ColorConstants.primary : ColorConstants.primary.withOpacity(.16), borderRadius: BorderRadius.circular(AppDimension.radius)),
            ),
          ).toList(),
        );
      },
    );
  }
}
