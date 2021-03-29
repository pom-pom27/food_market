part of 'screen.dart';

class SignUpAddressScreen extends StatefulWidget {
  const SignUpAddressScreen({Key key}) : super(key: key);

  @override
  _SignUpAddressScreenState createState() => _SignUpAddressScreenState();
}

class _SignUpAddressScreenState extends State<SignUpAddressScreen> {
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _houseNumberController = TextEditingController();
  final _cityController = TextEditingController();
  final dropdownList = ['Jakarta', 'Bandung', 'Bekasi', 'Bogor'];
  bool isLoading = false;
  String _dropdownValue = "Jakarta";

  @override
  Widget build(BuildContext context) {
    return GeneralScreen(
      title: "Address",
      onBackButtonPressed: () {
        Get.back();
      },
      subtitle: "Make sure it’s valid",
      child: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextInput(
              controller: _phoneNumberController,
              labelText: 'Phone No.',
              hintText: 'Type your phone number',
            ),
            const SizedBox(height: 16.0),
            TextInput(
              controller: _addressController,
              labelText: 'Address',
              hintText: 'Type your address',
            ),
            const SizedBox(height: 16.0),
            TextInput(
              controller: _houseNumberController,
              labelText: 'House No.',
              hintText: 'Type your house number',
            ),
            const SizedBox(height: 16.0),
            Dropdown(
              dropdownList: dropdownList,
              labelText: 'City',
              dropdownValue: _dropdownValue,
              onChanged: (newValue) {
                setState(() {
                  _dropdownValue = newValue;
                });
              },
            ),
            const SizedBox(height: 24.0),
            SizedBox(
              child: isLoading
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                    )
                  : Button(
                      labelText: 'Sign Up Now',
                      style: primaryButton,
                      onPressed: () {},
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _addressController.dispose();
    _houseNumberController.dispose();
    _cityController.dispose();
    super.dispose();
  }
}
