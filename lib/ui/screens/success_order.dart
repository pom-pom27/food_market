part of 'screen.dart';

class SuccessOrderScreen extends StatelessWidget {
  const SuccessOrderScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IllustrationScreen(
        title: 'You’ve Made Order',
        subtitle: 'Just stay at home while we are \n preparing your best foods',
        labelButton1: 'Order Other Foods',
        onPress1: () {},
        imagePath: 'assets/bike.png',
        onPress2: () {},
        labelButton2: 'View My Order',
      ),
    );
  }
}
