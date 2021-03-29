part of 'widgets.dart';

class Button extends StatelessWidget {
  const Button({Key key, this.onPressed, this.labelText, this.style})
      : super(key: key);

  final void Function() onPressed;
  final String labelText;
  final ButtonStyle style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: style,
        onPressed: onPressed,
        child: Text(
          labelText,
        ),
      ),
    );
  }
}
