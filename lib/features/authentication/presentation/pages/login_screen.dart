import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:nyt/features/authentication/presentation/controller/auth_cubit.dart';
import 'package:nyt/features/authentication/presentation/widgets/login/auth_background.dart';
import 'package:nyt/features/authentication/presentation/widgets/login/auth_form.dart';
import 'package:nyt/features/authentication/presentation/widgets/login/auth_header.dart';
import 'package:nyt/features/news/presentation/pages/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
      if (state is AuthLoading) {
        context.loaderOverlay.show();
      } else if (state is AuthLoaded) {
        context.loaderOverlay.hide();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> const HomeScreen()), (route) => false);
      } else if (state is AuthError) {
        context.loaderOverlay.hide();
        var snackBar = SnackBar(
          content: Text(state.errorMessage.msg),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }},
      child:  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.green,
      body: const AuthBackground(
        body: SingleChildScrollView(
            child: SafeArea(
          child: Center(
            child: Column(
              children: [
                AuthHeader(title: "Login Screen",),
                AuthForm(login: true,),
              ],
            ),
          ),
        )),
      ),
    ),
);
  }
}

