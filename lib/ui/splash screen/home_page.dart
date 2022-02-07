import 'package:flutter/material.dart';

import 'web_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return const CommonWebView(
      url: 'https://projections.co.in/',
      title: '',
    );
  }
}
