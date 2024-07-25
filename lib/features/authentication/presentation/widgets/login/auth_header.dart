

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthHeader extends StatelessWidget {
   const AuthHeader({super.key, required this.title});
 final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        45.verticalSpace,
        Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 25.sp,
              color: Colors.black,
            ),
          ),
        ),
        20.verticalSpace,
      ],
    );
  }
}