import 'package:fijob/commons/constants/app_dimens.dart';
import 'package:fijob/presentation/home/bloc/home_bloc.dart';
import 'package:fijob/presentation/shared/app_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yh_basic/shared/shared.dart';

import '../../commons/widgets/form_location/form_location.dart';
import 'bloc/home_event.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingLG),
          child: Column(
            children: [
              // Expanded(
              //   child: ViewStateBuilder<HomeBloc>(
              //     onLoading: (context, data) => const CircularProgressIndicator(),
              //     onError: (context, error) => Text('err: $error'),
              //     onSuccess: (context, data) {
              //       return BaseRefreshView(
              //         onRefresh: () => bloc.add(HomeRefreshPostEvent()),
              //         refresh: bloc.refreshController,
              //         itemCount: 10,
              //         itemBuilder: (context, index) => Card(
              //           child: ListTile(
              //             title: Text("data $index"),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              const SizedBox(height: 30),
              FormLocation()
            ],
          ),
        ),
      ),
    );
  }
}
