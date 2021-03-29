part of 'widgets.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    Key key,
    this.selectedIndex,
    @required this.titles,
    this.onTap,
  }) : super(key: key);

  final int selectedIndex;
  final List<String> titles;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Column(
        children: [
          Row(
            children: titles
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(left: defaultMargin, top: 9),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (onTap != null) onTap(titles.indexOf(e));
                          },
                          child: Text(
                            e,
                            style: titles.indexOf(e) == selectedIndex
                                ? blackFontStyleMid.copyWith(
                                    fontWeight: FontWeight.bold)
                                : greyFontStyleMid,
                          ),
                        ),
                        //*indicator
                        Container(
                          width: 40,
                          height: 3,
                          margin: const EdgeInsets.only(top: 9),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.5),
                            color: titles.indexOf(e) == selectedIndex
                                ? secondaryColor
                                : Colors.transparent,
                          ),
                        )
                      ],
                    ),
                  ),
                )
                .toList(),
          ), //* garis bawah
          Container(
            // margin: const EdgeInsets.only(bottom: 48.0),
            height: 1.0,
            color: greyColor2,
          ),
        ],
      ),
    );
  }
}
