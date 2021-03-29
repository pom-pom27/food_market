part of 'screen.dart';

class TestingWidget extends StatefulWidget {
  const TestingWidget({Key key}) : super(key: key);

  @override
  _TestingWidgetState createState() => _TestingWidgetState();
}

class _TestingWidgetState extends State<TestingWidget>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = const <Tab>[
    Tab(
      text: 'New Taste',
    ),
    Tab(
      text: 'Popular',
    ),
    Tab(
      text: 'Recommended',
    )
  ];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          // child: DefaultTabController(length: length, child: TabBar(tabs: )),
          ),
    );
  }
}
