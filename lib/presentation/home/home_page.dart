import 'package:fijob/presentation/home/bloc/home_bloc.dart';
import 'package:fijob/presentation/home/bloc/home_state.dart';
import 'package:fijob/presentation/shared/app_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yh_basic/shared/base_state_view.dart';
import 'package:yh_basic/shared/shared.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseStateView<HomePage, HomeBloc> {
  @override
  HomeBloc get initBloc => HomeBloc.to;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppHeader(text: "Home"),
        body: ListView(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) => Text('data...${state}'),
            ),
          ],
        ),
      ),
    );
  }
}
