import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InputWebView extends StatefulWidget {
  const InputWebView({super.key});

  @override
  State<InputWebView> createState() => _InputWebViewState();
}

class _InputWebViewState extends State<InputWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..addJavaScriptChannel('messageHandler', onMessageReceived: (message) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(message.message)),
        );
      })
      ..loadFlutterAsset('assets/view.html')
      ..setNavigationDelegate(
        NavigationDelegate(
            onPageFinished: (value) => {
                  controller.runJavaScript(
                      'messageHandler.postMessage(\'hello\', \'*\')')
                }),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('이름 입력하기')),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
