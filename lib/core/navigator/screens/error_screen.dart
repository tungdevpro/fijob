import 'package:fijob/core/navigator/route_path.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Error Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(RoutePath.initial, (route) => false),
          child: const Text("Go to home page"),
        ),
      ),
    );
  }
}
