import 'package:flutter/material.dart';
import 'package:tesla_app/constanins.dart';
import 'package:tesla_app/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: const Duration(seconds: 4), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);


    Future.delayed(
      const Duration(seconds: 6),
      () {
        Navigator.of(context).pushReplacementNamed('/home_screen');
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();
    return FadeTransition(
      opacity: _animation,
      child: Image.asset('assets/images/logo.png'),
    );
  }
}
