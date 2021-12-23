import 'package:flutter/material.dart';
import 'package:projections/ui/onBoarding/onBoarding_page_2.dart';
import 'package:projections/ui/onBoarding/onBoarding_page_3.dart';
import 'package:projections/ui/onBoarding/onBorading_page_1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  final _controller = PageController();

  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: h * 0.85,
            child: PageView(
              controller: _controller,
              children: const [
                OnBoardingPage1(),
                OnBoardingPage2(),
                OnBoardingPage3(),
              ],
            ),
          ),
          SizedBox(
            height: h * 0.05,
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: JumpingDotEffect(
              spacing: w * 0.04,
              activeDotColor: Colors.blue,
              dotColor: Colors.cyan,
              dotHeight: h * 0.018,
              dotWidth: w * 0.035,
              jumpScale: h * 0.0025,
              strokeWidth: w * 0.02,
            ),
          ),
        ],
      ),
    );
  }
}
