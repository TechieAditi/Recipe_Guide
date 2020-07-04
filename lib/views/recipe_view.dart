import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';
class RecipeView extends StatefulWidget {
  final String postUrl;
  RecipeView({this.postUrl});
  @override
  _RecipeState createState() => _RecipeState();
}

class _RecipeState extends State<RecipeView> {
  String finalUrl;
  final Completer<WebViewController> _completer=Completer<WebViewController>();


  @override
  void initState() {
    if(widget.postUrl.contains("http://")){
      finalUrl=widget.postUrl.replaceAll("http://", "https://");
    }
    else
      {
        finalUrl=widget.postUrl;

      }
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: Platform.isIOS? 60: 30, right: 24,left: 24,bottom: 16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          const Color(0xff213A50),
                          const Color(0xff071930)
                        ],
                        begin: FractionalOffset.topRight,
                        end: FractionalOffset.bottomLeft)),
                child:  Row(
                  mainAxisAlignment: kIsWeb
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Khana",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight:FontWeight.w500,
                        color: Colors.white,
                      ),),
                    Text("Shana",
                      style :TextStyle(
                          color: Colors.blue,
                          fontWeight:FontWeight.w500,
                          fontSize: 24
                      ),)
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height-100,
                width: MediaQuery.of(context).size.width,
                child: WebView(
                  initialUrl: finalUrl,
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController){
                    setState(() {
                      _completer.complete(webViewController);
                    });
                  },
                ),
              )
            ],

          )
      ),
    );
  }
}
