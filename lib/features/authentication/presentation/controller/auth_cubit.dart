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
  final ISimpleUserData userData =
      UserDataFactory.createUserData(LocalDataType.secured);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final LocalAuthentication _localAuth = LocalAuthentication();
  final emailController =
      TextEditingController(text: "mohamed.essam9393@gmail.com");
  final passwordController = TextEditingController(text: "Moh@med.com5");
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthCubit() : super(AuthInitial());

  Future<void> register() async {
    if (loginFormKey.currentState!.validate()) {
      emit(AuthLoading());
      try {
        // Check if fingerprint authentication is available
        bool canCheckBiometrics = await _localAuth.canCheckBiometrics;
        if (canCheckBiometrics) {
          bool authenticated = await _localAuth.authenticate(
            localizedReason: 'Please authenticate to proceed',
          );

          if (!authenticated) {
            emit(AuthError(
                errorMessage: const ErrorMessageModel(
                    msg: 'Fingerprint authentication failed')));
            return;
          }
        } else {
          emit(AuthError(
              errorMessage: const ErrorMessageModel(
                  msg: 'Biometric authentication is not available')));
          return;
        }

        // Proceed with Firebase authentication
        final UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        // Successfully logged in, update UI or save user data
        final user = userCredential.user;
        if (user != null) {
          // Save user data
          UserModel userModel = UserModel(
            token: userCredential.user!.uid,
            email: userCredential.user!.email??"",
            name: userCredential.user!.displayName??"",
          );

          userData.writeJsonMap(
            "userData",
            userModel.toJson(),
          );
          emit(AuthLoaded(userData: user));
        } else {
          emit(AuthError(
              errorMessage: const ErrorMessageModel(msg: 'User is null')));
        }
      } catch (e) {
        // Auth failed, handle the error
        emit(AuthError(errorMessage: ErrorMessageModel(msg: e.toString())));
      }
    }
  }

  Future<void> registerWithGoogle() async {
    try {
      // Sign out any existing Google user
      _googleSignIn.signOut();

      // Start Google Sign-In process
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // If user cancels sign-in, show error message and return
      if (googleUser == null) {
        emit(AuthError(
            errorMessage: const ErrorMessageModel(msg: 'Google Sign-In canceled')));
        return;
      }

      // Obtain authentication tokens
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      // Create Firebase credential using Google authentication tokens
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Google credential using Firebase
      final UserCredential userCredential = await _auth.signInWithCredential(credential);

      // Check if the user is signing in for the first time
      final isNewUser = userCredential.additionalUserInfo?.isNewUser ?? false;

      if (isNewUser) {
        // If user is new, save user data and perform registration
        final user = userCredential.user;
        if (user != null) {
          UserModel userModel = UserModel(
            token: userCredential.user!.uid,
            email: userCredential.user!.email!,
            name: userCredential.user!.displayName!,
          );
          userData.writeJsonMap(
            "userData",
            userModel.toJson(),
          );
          emit(AuthLoaded(userData: user));
        } else {
          emit(AuthError(
              errorMessage: const ErrorMessageModel(msg: 'User is null')));
        }
      } else {
        // If user already exists, proceed with sign-in
        final user = userCredential.user;
        if (user != null) {
          UserModel userModel = UserModel(
            token: userCredential.user!.uid,
            email: userCredential.user!.email!,
            name: userCredential.user!.displayName!,
          );
          userData.writeJsonMap(
            "userData",
            userModel.toJson(),
          );
          emit(AuthLoaded(userData: user));
        } else {
          emit(AuthError(
              errorMessage: const ErrorMessageModel(msg: 'User is null')));
        }
      }
    } catch (e) {
      // Handle the error
      emit(AuthError(errorMessage: ErrorMessageModel(msg: e.toString())));
    }
  }
}

class UserModel {
  final String email;
  final String name;
  final String token;
  UserModel({required this.email, required this.name, required this.token});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String,
      name: json['name'] as String,
      token: json['token'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'token': token,
    };
  }
}
