part of 'widgets.dart';

class Dropdown extends StatelessWidget {
  const Dropdown(
      {Key key,
      this.dropdownValue,
      this.dropdownList,
      this.onChanged,
      this.labelText})
      : super(key: key);
  final String dropdownValue;
  final String labelText;
  final List<String> dropdownList;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 6.0),
          child: Text(labelText, style: blackFontStyleMid),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: secondaryColor)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: dropdownValue,
              onChanged: onChanged,
              items: dropdownList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
