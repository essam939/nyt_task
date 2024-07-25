part of '../../pages/auth_screen.dart';
class _LoginAccount extends StatelessWidget {
  const _LoginAccount();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.verticalSpace,
        GestureDetector(
          onTap: (){},
          child: RichText(
              text: const TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(color: Colors.grey),
                  children: [
                    TextSpan(
                        text: 'log in',
                        style: TextStyle(color: Colors.black))
                  ])),
        ),
      ],
    );
  }
}