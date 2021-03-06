import 'dart:io';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CommonWebView extends StatefulWidget {
  final String title;
  final String url;
  const CommonWebView({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);
  @override
  CommonWebViewState createState() => CommonWebViewState();
}

class CommonWebViewState extends State<CommonWebView> {
  bool isLoading = false;
  late WebViewController viewController;
  @override
  void initState() {
    super.initState();
    isLoading = true;
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showWarning(context);
        return shouldPop ?? false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              WebView(
                initialUrl: widget.url,
                allowsInlineMediaPlayback: true,
                javascriptMode: JavascriptMode.unrestricted,
                zoomEnabled: true,
                userAgent:
                    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36',
                onPageStarted: (_) {
                  setState(() {
                    isLoading = true;
                  });
                },
                onProgress: (index) {
                  if (index < 90) {
                    setState(() {
                      isLoading = true;
                    });
                  } else {
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                onPageFinished: (url) {
                  setState(() {
                    isLoading = false;
                  });
                },
                onWebViewCreated: (controller) {
                  viewController = controller;
                },
              ),
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 19, 219, 241),
                    ))
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }

  Future<bool?> showWarning(BuildContext context) async {
    // if(viewController.currentUrl().contains('homeskitchen'))
    print('hellllllllll');
    if (await viewController.canGoBack()) {
      viewController.goBack();
      print("-------go back---------");
      return Future.value(false);
    } else {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Do you want to exit the app ?'),
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 17.5,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6.0),
            ),
          ),
          contentPadding: const EdgeInsets.only(
            top: 10.0,
            bottom: 10.0,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text(
                'No',
                style: TextStyle(
                  color: Colors.red.shade600,
                  fontSize: 15.5,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(
                'Yes',
                style: TextStyle(
                  color: Colors.red.shade600,
                  fontSize: 15.5,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
