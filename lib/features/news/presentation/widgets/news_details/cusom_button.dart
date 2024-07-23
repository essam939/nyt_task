import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });
  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}