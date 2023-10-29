import 'package:fijob/commons/constants/app_dimens.dart';
import 'package:fijob/commons/constants/app_typography.dart';
import 'package:fijob/commons/constants/asset/icon_resource.dart';
import 'package:fijob/commons/constants/color_constant.dart';
import 'package:fijob/core/navigator/route_path.dart';
import 'package:fijob/di/di.dart';
import 'package:fijob/domain/validators/fullname_validate.dart';
import 'package:fijob/presentation/auth/auth_constant.dart';
import 'package:fijob/presentation/auth/components/auth_terms_condition_bottom.dart';
import 'package:fijob/presentation/auth/register/bloc/register_event.dart';
import 'package:fijob/presentation/auth/register/bloc/register_state.dart';
import 'package:fijob/presentation/shared/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yh_basic/navigator/app_navigator.dart';
import 'package:yh_basic/shared/base_state_view.dart';

import '../../shared/app_header.dart';
import '../../shared/custom_input_field.dart';
import '../components/continue_with_3rd_party.dart';
import 'bloc/register_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseStateView<RegisterPage, RegisterBloc> {
  @override
  RegisterBloc get initBloc => RegisterBloc.to;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppHeader(),
        bottomNavigationBar: const AuthTermsConditionBottom(),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: AppDimension.paddingXXL),
          physics: const ClampingScrollPhysics(),
          children: [
            const SizedBox(height: AppDimension.paddingXXL),
            BlocSelector<RegisterBloc, RegisterState, bool>(
              selector: (state) => state.isNextComplete,
              builder: (context, isNextComplete) {
                return _buildLabel(isNextComplete ? AuthConstant.nextStepCompleteLabel : AuthConstant.registerLabel);
              },
            ),
            const SizedBox(height: AppDimension.paddingXXL),
            BlocSelector<RegisterBloc, RegisterState, bool>(
              selector: (state) => state.isNextComplete,
              builder: (context, isNextComplete) {
                return !isNextComplete
                    ? Column(
                        children: [
                          const ContinueWidth3rdParty(),
                          const SizedBox(height: AppDimension.paddingXXL),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: AppDimension.maxPadding),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(child: Container(height: 1, color: const Color(0xffE3E7EC))),
                                const SizedBox(width: AppDimension.padding),
                                const Text(AuthConstant.continueWith, style: TextStyle(fontWeight: FontWeight.w600, color: ColorConstants.gray60)),
                                const SizedBox(width: AppDimension.padding),
                                Expanded(child: Container(height: 1, color: const Color(0xffE3E7EC))),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppDimension.paddingXXL),
                          BlocBuilder<RegisterBloc, RegisterState>(
                            buildWhen: (previous, current) => previous.email != current.email,
                            builder: (context, state) => CustomInputField(
                              onChanged: (email) => bloc.add(RegisterEmailChanged(email)),
                              errorText: state.email.displayError,
                              labelText: AuthConstant.emailField,
                              hintText: AuthConstant.emailFieldPlaceholder,
                              prefixIcon: SvgPicture.asset(IconResource.icEmailLight),
                              controller: bloc.emailController,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          BlocBuilder<RegisterBloc, RegisterState>(
                            buildWhen: (previous, current) => previous.fullName != current.fullName,
                            builder: (context, state) => CustomInputField(
                              onChanged: (val) => bloc.add(RegisterFullNameChanged(val)),
                              errorText: state.fullName.displayError?.toValue(),
                              labelText: AuthConstant.fullNameField,
                              hintText: AuthConstant.fullNameFieldPlaceholder,
                              prefixIcon: SvgPicture.asset(IconResource.icUser),
                              controller: bloc.fullNameController,
                            ),
                          ),
                          const SizedBox(height: AppDimension.paddingXXL),
                          BlocBuilder<RegisterBloc, RegisterState>(
                            buildWhen: (previous, current) => previous.password != current.password,
                            builder: (context, state) => CustomInputField(
                              onChanged: (val) => bloc.add(RegisterPasswordChanged(val)),
                              errorText: state.password.displayError,
                              labelText: AuthConstant.passwordField,
                              hintText: AuthConstant.passwordFieldPlaceholder,
                              prefixIcon: SvgPicture.asset(IconResource.icUser),
                              controller: bloc.passwordController,
                            ),
                          ),
                        ],
                      );
              },
            ),
            const SizedBox(height: AppDimension.maxPadding),
            BlocSelector<RegisterBloc, RegisterState, bool>(
              selector: (state) => state.isNextComplete,
              builder: (context, isNextComplete) {
                return CustomButton(
                  onTap: () {
                    if (!isNextComplete) {
                      bloc.add(RegisterNextStepCompleteEvent(true));
                      return;
                    }
                    bloc.add(RegisterSubmittedEvent(email: bloc.emailController.text, fullName: bloc.fullNameController.text, password: bloc.passwordController.text));
                  },
                  fontSize: AppTypography.largeFs,
                  title: AuthConstant.btnWidthEmail,
                );
              },
            ),
            const SizedBox(height: AppDimension.paddingXXL),
            Center(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: ColorConstants.gray60, fontWeight: FontWeight.w600, fontSize: AppTypography.largeFs),
                  children: <TextSpan>[
                    const TextSpan(text: '${AuthConstant.hasAccount} '),
                    TextSpan(
                        text: AuthConstant.shortLoginLabel,
                        style: const TextStyle(color: ColorConstants.primary),
                        recognizer: TapGestureRecognizer()..onTap = () => _onGoToLogin()),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Center(child: Text(text, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: AppTypography.maxLargeFs)));
  }

  void _onGoToLogin() => bloc.navigator.pushNamed(RoutePath.home);
}
