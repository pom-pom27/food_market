part of 'widgets.dart';

class CircularLoading extends StatelessWidget {
  const CircularLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
    );
  }
}
