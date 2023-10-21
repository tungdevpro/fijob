import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fijob/core/navigator/screens/internet_status_page.dart';
import 'package:fijob/presentation/splash/components/splash_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yh_basic/yh_basic.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
      stream: context.watch<AppCubit>().state.connectivityStream,
      builder: (context, snapshot) {
        final hasConnected = [ConnectivityResult.wifi, ConnectivityResult.ethernet, ConnectivityResult.mobile].contains(snapshot.data);
        return Stack(
          fit: StackFit.expand,
          children: [const SplashContent(), if (!hasConnected && snapshot.connectionState != ConnectionState.waiting) const InternetStatusPage()],
        );
      },
    );
  }
}
