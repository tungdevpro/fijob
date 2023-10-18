import 'package:fijob/commons/constants/asset/image_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InternetStatusPage extends StatelessWidget {
  const InternetStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: .0,
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(ImageResource.imgNoConnection),
              const Center(child: Text('No internet connection')),
            ],
          ),
        ),
      ),
    );
  }
}
