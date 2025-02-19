import 'package:flutter/material.dart';
import 'package:focusflow/core/utils/app_theme.dart';

void main() {
  runApp(FocusFLowApp());
}

class FocusFLowApp extends StatelessWidget {
  const FocusFLowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getLightTheme(),
      title: "Posts App",
      home: Scaffold(
        appBar: AppBar(title: Text("Posts App")),
        body: Center(child: Text("Hello World !!!")),
      ),
    );
  }
}
