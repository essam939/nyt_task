import 'package:flutter/material.dart';
import 'package:nyt/core/service/local/interface/i_simple_user_data.dart';
import 'package:nyt/core/service/local/user_data_factory.dart';
import 'package:nyt/core/utilities/enums.dart';
import 'package:nyt/features/authentication/presentation/pages/login_screen.dart';
import 'package:nyt/features/news/presentation/pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late ISimpleUserData userData=
  UserDataFactory.createUserData(LocalDataType.secured);
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Adjust the duration as per your requirement
    );

    _animation = Tween<double>(
      begin: 0,
      end: 2,
    ).animate(_controller);

    _controller.forward();

    // Navigate to the next screen after the animation completes
    _animation.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        final result = await userData.readJsonMap("userData");
        if(result!=null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        }else{
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const LoginScreen()),
          );
        }

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: const FlutterLogo(
            size: 200,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}