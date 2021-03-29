part of 'screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralScreen(
      title: "Sign In",
      subtitle: "Find your best ever meal",
      child: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextInput(
              controller: _emailController,
              labelText: 'Email Address',
              hintText: 'Type your email address',
            ),
            const SizedBox(height: 16.0),
            TextInput(
              controller: _passwordController,
              labelText: 'Password',
              hintText: 'Type your password address',
            ),
            const SizedBox(height: 24.0),
            SizedBox(
              child: isLoading
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                    )
                  : Button(
                      labelText: 'Sign In',
                      style: primaryButton,
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });

                        await context.read<UserCubit>().signIn(
                            _emailController.text, _passwordController.text);

                        final UserState _userState =
                            context.read<UserCubit>().state;

                        if (_userState is UserLoaded) {
                          context.read<FoodCubit>().getFoods();
                          context.read<TransactionCubit>().getTransaction();
                          Get.offAndToNamed('/main');
                        } else {
                          setState(() {
                            isLoading = false;
                          });
                          Get.snackbar('', '',
                              backgroundColor: Colors.red,
                              icon: const Icon(Icons.close),
                              titleText: Text(
                                'Sign in Failed',
                                style: blackFontStyleBig.copyWith(
                                    color: Colors.white),
                              ),
                              messageText: Text(
                                (_userState as UserLoadingFailed).message,
                                style: blackFontStyleMid.copyWith(
                                    color: Colors.white),
                              ));
                        }
                      }),
            ),
            const SizedBox(height: 12),
            Button(
              style: secondaryButton,
              labelText: 'Create New Account',
              onPressed: () {
                Get.toNamed('/fds');
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }
}
