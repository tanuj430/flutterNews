import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReadingWeb extends StatefulWidget {
  final String url;

  const ReadingWeb({Key? key, required this.url}) : super(key: key);

  @override
  State<ReadingWeb> createState() => _ReadingWebState();
}

class _ReadingWebState extends State<ReadingWeb> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}