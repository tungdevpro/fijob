import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                context.go("/");
              },
              child: Text("return init "),
            ),
            SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  context.push("/home/123");
                },
                child: Text("Detail 22"))
          ],
        ),
      ),
    );
  }
}
