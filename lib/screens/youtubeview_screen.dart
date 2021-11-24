import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class YouTubeViewScreen extends StatefulWidget {
  const YouTubeViewScreen({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  State<YouTubeViewScreen> createState() => _YouTubeViewScreenState();
}

class _YouTubeViewScreenState extends State<YouTubeViewScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.url),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webviewctrl) {
              _controller.complete(webviewctrl);
            },
          );
        },
      ),
    );
  }
}
