part of 'screen.dart';

class SuccessSignUpScreen extends StatelessWidget {
  const SuccessSignUpScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IllustrationScreen(
        title: 'Yeay! Completed',
        subtitle: 'Now you are able to order \n some foods as a self-reward',
        labelButton1: 'Find Foods',
        onPress1: () {},
        imagePath: 'assets/food_wishes.png',
      ),
    );
  }
}
