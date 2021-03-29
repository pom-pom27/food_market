part of 'shared.dart';

//colors
Color primaryColor = "#FFC700".toColor();
Color secondaryColor = "#020202".toColor();
Color accentColor = "#1ABC9C".toColor();
Color greyColor = "#8D92A3".toColor();
Color backgroundColor = "#FAFAFC".toColor();
Color greyColor2 = "#F2F2F2".toColor();

//text style
TextStyle greyFontStyleBig = GoogleFonts.poppins()
    .copyWith(color: greyColor, fontSize: 22, fontWeight: FontWeight.bold);
TextStyle greyFontStyleMid = GoogleFonts.poppins()
    .copyWith(color: greyColor, fontSize: 16, fontWeight: FontWeight.w300);
TextStyle greyFontStyleSml = GoogleFonts.poppins().copyWith(color: greyColor);

TextStyle blackFontStyleBig = GoogleFonts.poppins().copyWith(
    color: secondaryColor, fontSize: 22.0, fontWeight: FontWeight.bold);
TextStyle blackFontStyleMid = GoogleFonts.poppins().copyWith(
    color: secondaryColor, fontSize: 16.0, fontWeight: FontWeight.w500);
TextStyle blackFontStyleSml =
    GoogleFonts.poppins().copyWith(color: secondaryColor);

TextStyle buttonTextStyle =
    GoogleFonts.poppins().copyWith(fontSize: 16.0, fontWeight: FontWeight.bold);

//button style
ButtonStyle primaryButton = ElevatedButton.styleFrom(
  primary: primaryColor,
  onPrimary: secondaryColor,
  textStyle: buttonTextStyle,
  padding: const EdgeInsets.symmetric(vertical: 11.0),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
);
ButtonStyle secondaryButton = ElevatedButton.styleFrom(
  primary: greyColor,
  textStyle: buttonTextStyle,
  onPrimary: Colors.white,
  padding: const EdgeInsets.symmetric(vertical: 11.0),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
);

//dimens
const double defaultMargin = 24.0;
const double headerHeight = 80.0;
const double borderRadius = 8.0;
