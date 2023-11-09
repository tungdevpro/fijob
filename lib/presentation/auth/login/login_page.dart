import 'package:fijob/presentation/auth/login/bloc/login_bloc.dart';
import 'package:fijob/presentation/shared/app_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yh_basic/shared/base_state_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseStateView<LoginPage, LoginBloc> {
  @override
  LoginBloc get initBloc => LoginBloc.to;

  @override
  Widget buildChild() {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppHeader(),
      ),
    );
  }
}
