import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:local_auth/local_auth.dart';
import 'package:nyt/core/service/local/interface/i_simple_user_data.dart';
import 'package:nyt/core/service/local/user_data_factory.dart';
import 'package:nyt/core/service/remote/error_message_remote.dart';
import 'package:nyt/core/utilities/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final ISimpleUserData userData = UserDataFactory.createUserData(LocalDataType.secured);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final LocalAuthentication _localAuth = LocalAuthentication();
  final emailController = TextEditingController(text: "mohamed.essam9393@gmail.com");
  final passwordController = TextEditingController(text: "Moh@med.com5");
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> register() async {
    if (loginFormKey.currentState?.validate() ?? false) {
      emit(AuthLoading());

      try {
        if (await _handleBiometrics()) {
          final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );

          final user = userCredential.user;
          if (user != null) {
            await user.sendEmailVerification();
            _saveUserData(userCredential);
            emit(AuthLoaded(userData: user));
          } else {
            emit(AuthError(errorMessage: const ErrorMessageModel(msg: 'User is null')));
          }
        }
      } catch (e) {
        emit(AuthError(errorMessage: ErrorMessageModel(msg: e.toString())));
      }
    }
  }

  Future<void> login() async {
    if (loginFormKey.currentState?.validate() ?? false) {
      emit(AuthLoading());

      try {
        if (await _handleBiometrics()) {
          final UserCredential userCredential = await _auth
              .signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );

          final user = userCredential.user;
          if (user != null) {
            if (user.emailVerified) {
              _saveUserData(userCredential);
              emit(AuthLoaded(userData: user));
            } else {
              emit(AuthError(errorMessage: const ErrorMessageModel(
                  msg: 'Email not verified')));
            }
          } else {
            emit(AuthError(
                errorMessage: const ErrorMessageModel(msg: 'User is null')));
          }
        }
      } catch (e) {
        emit(AuthError(errorMessage: ErrorMessageModel(msg: e.toString())));
      }
    }
  }

  Future<void> registerWithGoogle() async {
    try {
      await _googleSignIn.signOut();

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        emit(AuthError(errorMessage: const ErrorMessageModel(msg: 'Google Sign-In canceled')));
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);

      final user = userCredential.user;
      if (user != null) {
        _saveUserData(userCredential);
        emit(AuthLoaded(userData: user));
      } else {
        emit(AuthError(errorMessage: const ErrorMessageModel(msg: 'User is null')));
      }
    } catch (e) {
      emit(AuthError(errorMessage: ErrorMessageModel(msg: e.toString())));
    }
  }

  Future<bool> _handleBiometrics() async {
    try {
      if (await _localAuth.canCheckBiometrics) {
        final authenticated = await _localAuth.authenticate(localizedReason: 'Please authenticate to proceed');
        if (!authenticated) {
          emit(AuthError(errorMessage: const ErrorMessageModel(msg: 'Fingerprint authentication failed')));
          return false;
        }
        return true;
      } else {
        emit(AuthError(errorMessage: const ErrorMessageModel(msg: 'Biometric authentication is not available')));
        return false;
      }
    } catch (e) {
      emit(AuthError(errorMessage: ErrorMessageModel(msg: e.toString())));
      return false;
    }
  }

  void _saveUserData(UserCredential userCredential) {
    final user = userCredential.user;
    if (user != null) {
      final userModel = UserModel(
        token: user.uid,
        email: user.email ?? "",
        name: user.displayName ?? "",
      );
      userData.writeJsonMap("userData", userModel.toJson());
    }
  }
  // create logout function
  Future<void> logout() async {
    try {
      await _auth.signOut();
      userData.delete("userData");
      emit(AuthInitial());
    } catch (e) {
      emit(AuthError(errorMessage: ErrorMessageModel(msg: e.toString())));
    }
  }
}

class UserModel {
  UserModel({required this.email, required this.name, required this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String,
      name: json['name'] as String,
      token: json['token'] as String,
    );
  }

  final String email;
  final String name;
  final String token;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'token': token,
    };
  }
}