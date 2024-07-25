import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:nyt/core/service/remote/service_locator.dart';
import 'package:nyt/core/widget_life_cycle_listener.dart';
import 'package:nyt/features/authentication/presentation/controller/auth_cubit.dart';
import 'package:nyt/features/news/presentation/pages/home_screen.dart';


part '../widgets/register/auth_header.dart';
part '../widgets/register/auth_form.dart';
part '../widgets/register/auth_background.dart';
part '../widgets/register/forget_password.dart';
part '../widgets/register/login_account.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

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
        }
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
          ),
          backgroundColor: Colors.green,
          body: const _AuthBackground(
            body: SingleChildScrollView(
                child: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    _AuthHeader(),
                    _AuthForm(),
                    _ForgetPassword(),
                    _LoginAccount(),
                  ],
                ),
              ),
            )),
          )),
    );
  }
}
