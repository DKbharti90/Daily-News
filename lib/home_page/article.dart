import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Articles extends StatefulWidget {
  final String blogUrl;

  Articles({this.blogUrl});

  @override
  _ArticlesState createState() => _ArticlesState();




}

class _ArticlesState extends State<Articles> {
  final Completer<WebViewController> _completer=new Completer<WebViewController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

  }

  @override
  Widget build(BuildContext context) {
    print(widget.blogUrl);


  return Scaffold(

      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Flutter"),
            Text(
              "News",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        elevation: 0.0,
        centerTitle: true,
      ),

      body:  Container(

        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: WebView(
          initialUrl: widget.blogUrl,
          onWebViewCreated: ((WebViewController webViewController){
            _completer.complete(webViewController);
          }),

        ),
      ),

    );



  }
}
