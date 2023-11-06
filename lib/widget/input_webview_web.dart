import 'dart:ui' as ui;
import 'dart:html' as html;

import 'package:flutter/material.dart';

class InputWebView extends StatefulWidget {
  const InputWebView({super.key});

  @override
  State<InputWebView> createState() => _InputWebViewState();
}

class _InputWebViewState extends State<InputWebView> {
  @override
  void initState() {
    super.initState();

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'input-webview',
      (int viewId) => html.IFrameElement()
        ..style.width = '100%'
        ..style.height = '100%'
        ..src = 'assets/view.html'
        ..style.border = 'none',
    );

    html.window.onMessage.listen((event) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text(event.data)),
      );
    });

    html.window.postMessage('hello', '*');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('이름 입력하기')),
      body: HtmlElementView(
        viewType: 'input-webview',
      ),
    );
  }
}
