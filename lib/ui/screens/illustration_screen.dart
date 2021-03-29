part of 'screen.dart';

class IllustrationScreen extends StatelessWidget {
  const IllustrationScreen(
      {Key key,
      @required this.title,
      @required this.subtitle,
      @required this.labelButton1,
      this.labelButton2,
      @required this.onPress1,
      this.onPress2,
      @required this.imagePath})
      : super(key: key);

  final String title;
  final String subtitle;
  final String imagePath;
  final String labelButton1;
  final String labelButton2;
  final void Function() onPress1;
  final void Function() onPress2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 30),
              Text(
                title,
                style: blackFontStyleMid,
              ),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: greyFontStyleMid,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 200,
                child: Button(
                  labelText: labelButton1,
                  onPressed: onPress1,
                  style: primaryButton,
                ),
              ),
              const SizedBox(height: 12),
              if (labelButton2 != null)
                SizedBox(
                  width: 200,
                  child: Button(
                    labelText: labelButton2,
                    onPressed: onPress2,
                    style: secondaryButton,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
