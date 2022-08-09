import 'package:flutter/material.dart';
import 'package:structure/models/model.dart';
import 'package:structure/services/todoservices.dart';
import '../utlis/utlis.dart';
import 'dart:io';
import 'homepage.dart';
import 'dart:async';
import '../widgets/widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen(this.index);

  int index;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true;
  final _key = UniqueKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: babypink,
      appBar: AppBar(
        backgroundColor: hotpink,
        title: Center(
          child: Text(
            'Details',
            style: ktextstyle,
          ),
        ),
      ),
      body: FutureBuilder(
          future: todoService,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return WebView(
                    key: _key,
                    initialUrl: snapshot.data!.articles![widget.index].url,
                    javascriptMode: JavascriptMode.unrestricted,
                    onPageFinished: (finish) {
                      setState(() {
                        isLoading = false;
                      });
                    },
                  );
            } else if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            }
            return Center(
                child: const CircularProgressIndicator(
              color: hotpink,
            ));
          }),
    );
  }
}
