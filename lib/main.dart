import 'package:flutter/material.dart';
import 'package:flutter_webview_communication/widget/input_webview_mobile.dart'
    if (dart.library.html) 'package:flutter_webview_communication/widget/input_webview_web.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showWebView(context),
          child: Text('이름 입력하기'),
        ),
      ),
    );
  }

  Future<void> _showWebView(BuildContext context) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => InputWebView()));
  }
}
