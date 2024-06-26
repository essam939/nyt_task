import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:nyt/core/service/remote/service_locator.dart';
import 'package:nyt/core/widget_life_cycle_listener.dart';
import 'package:nyt/features/authentication/presentation/controller/auth_cubit.dart';
import 'package:nyt/features/news/presentation/pages/home_screen.dart';


part '../widgets/login/auth_header.dart';
part '../widgets/login/auth_form.dart';
part '../widgets/login/auth_background.dart';
part '../widgets/login/forget_password.dart';
part '../widgets/login/login_account.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          context.loaderOverlay.show();
        } else if (state is AuthLoaded) {
          context.loaderOverlay.hide();
          Navigator.push(context, MaterialPageRoute(builder: (_)=> const HomeScreen()));
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
