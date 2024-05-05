import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt/core/service/local/interface/i_simple_user_data.dart';
import 'package:nyt/core/service/local/user_data_factory.dart';
import 'package:nyt/core/service/remote/error_message_remote.dart';
import 'package:nyt/core/utilities/enums.dart';
import 'package:nyt/features/authentication/domain/entities/login_request.dart';
import 'package:nyt/features/authentication/domain/entities/login_response.dart';
import 'package:nyt/features/authentication/domain/use_cases/login_usecase.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_state.dart';



class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  LoginCubit() : super(LoginInitial());

  Future<void> login() async {
    if (loginFormKey.currentState!.validate()) {
      emit(LoginLoading());
      try {
        final UserCredential userCredential =
        await _auth.signInWithEmailAndPassword(
          email: phoneController.text,
          password: passwordController.text,
        );

        // Successfully logged in, update UI or save user data
        final user = userCredential.user;
        if (user != null) {
          emit(LoginLoaded(userData: user));
        } else {
          emit(LoginError(errorMessage: ErrorMessageModel(msg: 'User not found')));
        }
      } catch (e) {
        // Login failed, handle the error
        emit(LoginError(errorMessage:  ErrorMessageModel(msg: 'User not found')));
      }
    }
  }
}

