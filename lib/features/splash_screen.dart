import 'package:flutter/material.dart';
import 'package:nyt/core/service/local/interface/i_simple_user_data.dart';
import 'package:nyt/core/service/local/user_data_factory.dart';
import 'package:nyt/core/utilities/enums.dart';
import 'package:nyt/features/authentication/presentation/pages/auth_screen.dart';
import 'package:nyt/features/news/presentation/pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late final ISimpleUserData userData;

  @override
  void initState() {
    super.initState();

    userData = UserDataFactory.createUserData(LocalDataType.secured);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 2,
    ).animate(_controller)
      ..addStatusListener(_animationStatusListener);

    _controller.forward();
  }

  void _animationStatusListener(AnimationStatus status) async {
    if (status == AnimationStatus.completed) {
      final result = await userData.readJsonMap("userData");
      if (!mounted) return; // Check if the widget is still mounted
      final nextPage = result != null ? const HomeScreen() : const LoginScreen();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => nextPage));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: const FlutterLogo(size: 200),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_animationStatusListener);
    _controller.dispose();
    super.dispose();
  }
}
