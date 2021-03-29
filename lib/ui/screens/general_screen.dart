part of 'screen.dart';

class GeneralScreen extends StatelessWidget {
  const GeneralScreen(
      {Key key,
      this.title,
      this.subtitle,
      this.onBackButtonPressed,
      this.child,
      this.bodyBackground})
      : super(key: key);

  final String title;
  final String subtitle;
  final Function onBackButtonPressed;
  final Widget child;
  final Color bodyBackground;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            color: Colors.white,
          ),
          Container(
            color: bodyBackground ?? Colors.white,
          ),
          ListView(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: headerHeight,
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultMargin),
                    color: Colors.white,
                    child: Row(
                      children: [
                        if (onBackButtonPressed != null)
                          GestureDetector(
                            onTap: () {
                              onBackButtonPressed();
                            },
                            child: Container(
                              width: 24,
                              margin: const EdgeInsets.only(right: 26),
                              height: 24,
                              child: const ImageIcon(
                                AssetImage('assets/back_arrow.png'),
                                semanticLabel: 'go back to previous screen',
                              ),
                            ),
                          )
                        else
                          const SizedBox(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title,
                              style: blackFontStyleBig,
                            ),
                            Text(
                              subtitle,
                              style: greyFontStyleMid,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: defaultMargin,
                    width: double.infinity,
                    color: backgroundColor,
                  ),
                  child ?? const SizedBox(),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
