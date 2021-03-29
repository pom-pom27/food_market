part of 'widgets.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    Key key,
    this.selectedIndex,
    this.onTap,
  }) : super(key: key);
  final int selectedIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.local_mall),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.person),
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: primaryColor,
      onTap: onTap,
    );
  }
}
