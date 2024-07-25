part of '../../pages/auth_screen.dart';

class _AuthForm extends StatelessWidget {
  const _AuthForm();

  @override
  Widget build(BuildContext context) {
    final authController = ServiceLocator.instance<AuthCubit>();
    return WidgetLifecycleListener(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: authController.loginFormKey,
        child: Column(
          children: [
            TextFormField(
              style: const TextStyle(color: Colors.black),
              textInputAction: TextInputAction.next,
              controller: authController.emailController,
              keyboardType: TextInputType.emailAddress,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9._%+-@]')),
              ],
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter an email address';
                }
                final emailRegExp =
                    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                if (!emailRegExp.hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Email Address',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                labelStyle: TextStyle(color: Colors.grey),
              ),
            ),
            20.verticalSpace,
            Stack(children: [
              TextFormField(
                style: const TextStyle(color: Colors.black),
                obscureText: true,
                textInputAction: TextInputAction.done,
                controller: authController.passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  final passwordRegExp =
                      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$');
                  if (passwordRegExp.hasMatch(value)) {
                    return 'Password must contain letters and numbers';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ]),
            10.verticalSpace,
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              SizedBox(
                width: 150.w,
                height: 50.h,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () async {
                      await authController.register();
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 20.sp),
                    )),
              ),
              GestureDetector(
                onTap: () async {
                  await authController.registerWithGoogle();
                },
                child: SizedBox(
                  width: 50.w,
                  height: 50.h,
                  child: Image.network(
                      "https://seeklogo.com/images/G/google-logo-28FA7991AF-seeklogo.com.png"),
                ),
              )
            ]),
          ],
        ),
      ),
    ));
  }
}
