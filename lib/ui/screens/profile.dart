part of 'screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 0;

  static const List<Map<String, String>> _accountTabList = [
    {
      'title': 'Edit Profile',
      'route': '/edit_profile',
    },
    {
      'title': 'Home Address',
      'route': '/home_address',
    },
    {
      'title': 'Security',
      'route': '/security',
    },
    {
      'title': 'Payments',
      'route': '/payment',
    },
  ];

  static const List<Map<String, String>> _foodMarketTabList = [
    {
      'title': 'Rate App',
      'route': '/rate_app',
    },
    {
      'title': 'Help Center',
      'route': '/help',
    },
    {
      'title': 'Privacy & Policy',
      'route': '/privacy',
    },
    {
      'title': 'Term & Condition',
      'route': '/term',
    },
  ];

  static const titlesTab = ['Account', 'FoodMarket'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              height: 230,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/photo_border.png'),
                        ),
                      ),
                      child: Image.network(
                        (context.read<UserCubit>().state as UserLoaded)
                            .user
                            .picturePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                        (context.read<UserCubit>().state as UserLoaded)
                            .user
                            .name,
                        style: blackFontStyleBig),
                    Text(
                        (context.read<UserCubit>().state as UserLoaded)
                            .user
                            .email,
                        style: greyFontStyleMid),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  CustomTabBar(
                    selectedIndex: _selectedIndex,
                    titles: titlesTab,
                    onTap: (idx) {
                      setState(() {
                        _selectedIndex = idx;
                      });
                    },
                  ),
                  if (_selectedIndex == 0)
                    Column(
                      children: _accountTabList
                          .map((e) => Card(
                                elevation: 0,
                                shape: Border(
                                  bottom: BorderSide(color: greyColor2),
                                ),
                                margin: EdgeInsets.zero,
                                child: ListTile(
                                  title: Text(e['title']),
                                  trailing: const Icon(Icons.chevron_right),
                                  onTap: () {
                                    Get.toNamed(e['route']);
                                  },
                                ),
                              ))
                          .toList(),
                    )
                  else
                    Column(
                      children: _foodMarketTabList
                          .map((e) => Card(
                                elevation: 0,
                                margin: EdgeInsets.zero,
                                shape: Border(
                                  bottom: BorderSide(color: greyColor2),
                                ),
                                child: ListTile(
                                  title: Text(e['title']),
                                  trailing: const Icon(Icons.chevron_right),
                                  onTap: () {
                                    Get.toNamed(e['route']);
                                  },
                                ),
                              ))
                          .toList(),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
