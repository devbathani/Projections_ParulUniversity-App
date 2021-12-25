import 'package:flutter/material.dart';
import 'package:projections/ui/onBoarding/onBoarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 3350), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => OnBoardingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.white,
              Colors.white,
              Colors.deepPurple,
            ],
          ),
        ),
        child: Center(
          child: SizedBox(
            height: h * 0.15,
            width: w * 0.30,
            child: Image.asset(
              'assets/projections_logo_anime.gif',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
