part of 'widgets.dart';

class TextInput extends StatelessWidget {
  const TextInput({Key key, this.controller, this.hintText, this.labelText})
      : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 6.0),
          child: Text(labelText, style: blackFontStyleMid),
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10.0),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: accentColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            hintStyle: greyFontStyleSml,
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
