import 'package:flutter/material.dart';

class DetailHomePage extends StatelessWidget {
  final String id;
  const DetailHomePage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("detail")),
      body: Center(
        child: Text("thi is ${id}"),
      ),
    );
  }
}
