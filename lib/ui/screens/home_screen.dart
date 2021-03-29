part of 'screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //*HEADER
            Container(
              color: Colors.white,
              height: headerHeight,
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'FoodMarket',
                        style: blackFontStyleBig,
                      ),
                      Text(
                        "Let's get some food",
                        style: greyFontStyleSml,
                      ),
                    ],
                  ),
                  CachedNetworkImage(
                      fit: BoxFit.contain,
                      width: 50,
                      height: 50,
                      imageUrl: (context.read<UserCubit>().state as UserLoaded)
                          .user
                          .picturePath)
                ],
              ),
            ),

            const SizedBox(height: 24.0),

            SizedBox(
              height: 250,
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overScroll) {
                  overScroll.disallowGlow();
                  return true;
                },
                child: BlocBuilder<FoodCubit, FoodState>(
                  builder: (context, state) => state is FoodsLoaded
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listFood.length,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(
                                left: index == 0 ? defaultMargin : 0,
                                right: defaultMargin),
                            child: FoodCard(
                              food: listFood[index],
                              heroTag: listFood[index].name,
                              onTap: () {
                                Get.to(() => FDScreen(
                                      transaction: Transaction(
                                          food: listFood[index],
                                          user: (context.read<UserCubit>().state
                                                  as UserLoaded)
                                              .user),
                                      onBackPress: () {
                                        Get.back();
                                      },
                                    ));
                              },
                            ),
                          ),
                        )
                      : const Center(child: CircularLoading()),
                ),
              ),
            ),

            const SizedBox(height: 24.0),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  CustomTabBar(
                    titles: const ['New taste', 'Popular', 'Recommended'],
                    selectedIndex: _selectedIndex,
                    onTap: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                  BlocBuilder<FoodCubit, FoodState>(
                    builder: (context, state) {
                      if (state is FoodsLoaded) {
                        final List<Food> list = state.foods
                            .where(
                              (e) => e.types.contains(_selectedIndex == 0
                                  ? FoodType.new_food
                                  : _selectedIndex == 1
                                      ? FoodType.popular
                                      : FoodType.recommend),
                            )
                            .toList();
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: defaultMargin,
                          ),
                          child: Column(
                            children: list
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: FoodListItem(
                                      food: e,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularLoading(),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
