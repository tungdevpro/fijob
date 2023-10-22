import 'package:fijob/commons/constants/app_dimens.dart';
import 'package:fijob/commons/constants/app_typography.dart';
import 'package:fijob/di/di.dart';
import 'package:fijob/presentation/auth/auth_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yh_basic/shared/base_state_view.dart';

import '../../shared/app_header.dart';
import 'bloc/register_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseStateView<RegisterPage, RegisterBloc> {
  @override
  void initBloc() => getIt<RegisterBloc>().initBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppHeader(),
        body: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            const SizedBox(height: AppDimension.paddingXXL),
            _buildLabel()
          ],
        ),
      ),
    );
  }
  
  Widget _buildLabel() {
    return const Center(child: Text(AuthConstant.registerLabel, style: TextStyle(fontWeight: FontWeight.w700, fontSize: AppTypography.maxLargeFs)));
  }
}
