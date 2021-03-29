import 'package:get/get.dart';

class MainScreenController extends GetxController {
  final _selectedIndex = 0.obs;
  set selectedIndex(int value) => _selectedIndex.value = value;
  int get selectedIndex => _selectedIndex.value;

  void onItemTapped(int index) {
    selectedIndex =
        index; // The set method is accessed this way, you have confused it with methods.
    update();
  }
}
