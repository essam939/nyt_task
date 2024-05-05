part of '../../pages/login_screen.dart';

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final authController = ServiceLocator.instance<LoginCubit>();
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
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter phone number';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'phone number',
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
                    return 'Please enter password';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'password',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 150.w,
                  height: 50.h,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        await authController.login();
                      },
                      child: Text(
                        'login',
                        style: TextStyle(fontSize: 20.sp),
                      )),
                ),
                GestureDetector(
                  onTap: ()async{
                    await authController.signInWithGoogle();
                  },
                  child: SizedBox(
                    width: 50.w,
                    height: 50.h,
                    child: Image.network("https://seeklogo.com/images/G/google-logo-28FA7991AF-seeklogo.com.png"),
                  ),
                )
              ]
            ),

          ],
        ),
      ),
    ));
  }
}
