part of '../../pages/auth_screen.dart';


class _AuthHeader extends StatelessWidget {
  const _AuthHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        45.verticalSpace,
        Center(
          child: Text(
            "Auth Screen",
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