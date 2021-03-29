part of 'screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralScreen(
      title: "Sign Up",
      onBackButtonPressed: () {
        Get.back();
      },
      subtitle: "Register and eat",
      child: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              width: 110,
              height: 110,
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/photo_border.png'),
                ),
              ),
              child: Image.network(
                'https://static.thenounproject.com/png/630729-200.png',
                fit: BoxFit.cover,
              ),
            ),
            TextInput(
              controller: _fullNameController,
              labelText: 'Full Name',
              hintText: 'Type your full name',
            ),
            const SizedBox(height: 16.0),
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
                      labelText: 'Continue',
                      style: primaryButton,
                      onPressed: () {
                        Get.toNamed('/signup_address');
                      },
                    ),
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
    _fullNameController.dispose();
    super.dispose();
  }
}
