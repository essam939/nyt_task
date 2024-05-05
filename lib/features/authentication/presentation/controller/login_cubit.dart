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

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final ISimpleUserData userData =
      UserDataFactory.createUserData(LocalDataType.secured);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final LocalAuthentication _localAuth = LocalAuthentication();
  final emailController =
      TextEditingController(text: "mohamed.essam9393@gmail.com");
  final passwordController = TextEditingController(text: "Moh@med.com5");
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  LoginCubit() : super(LoginInitial());

  Future<void> login() async {
    if (loginFormKey.currentState!.validate()) {
      emit(LoginLoading());
      try {
        // Check if fingerprint authentication is available
        bool canCheckBiometrics = await _localAuth.canCheckBiometrics;
        if (canCheckBiometrics) {
          bool authenticated = await _localAuth.authenticate(
            localizedReason: 'Please authenticate to proceed',
          );

          if (!authenticated) {
            emit(LoginError(
                errorMessage: const ErrorMessageModel(
                    msg: 'Fingerprint authentication failed')));
            return;
          }
        } else {
          emit(LoginError(
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
          print("klsdfghifgjsdhjkdf");
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
          print("klsdfghifgjsdhjkdf");
          emit(LoginLoaded(userData: user));
        } else {
          emit(LoginError(
              errorMessage: const ErrorMessageModel(msg: 'User is null')));
        }
      } catch (e) {
        // Login failed, handle the error
        emit(LoginError(errorMessage: ErrorMessageModel(msg: e.toString())));
      }
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      _googleSignIn.signOut();
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        emit(LoginError(
            errorMessage:
                const ErrorMessageModel(msg: 'Google Sign-In canceled')));
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Google credential using Firebase
      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user;
      UserModel userModel = UserModel(
        token: userCredential.user!.uid,
        email: userCredential.user!.email!,
        name: userCredential.user!.displayName!,
      );
      userData.writeJsonMap(
        "userData",
        userModel.toJson(),
      );
      emit(LoginLoaded(userData: user!));

    } catch (e) {
      // Handle the error
      emit(LoginError(errorMessage: ErrorMessageModel(msg: e.toString())));
      return null;
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
