part of 'screen.dart';

class FDScreen extends StatefulWidget {
  const FDScreen({Key key, this.onBackPress, this.transaction})
      : super(key: key);

  final void Function() onBackPress;
  final Transaction transaction;

  @override
  _FDScreenState createState() => _FDScreenState();
}

class _FDScreenState extends State<FDScreen> {
  final padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 16);
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final food = widget.transaction.food;

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left_rounded),
            iconSize: 30,
            color: secondaryColor,
            splashRadius: 25,
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: FlexibleHeaderDelegate(
                      statusBarHeight: MediaQuery.of(context).padding.top,
                      leading: const SizedBox(),
                      expandedHeight: 250,
                      background: MutableBackground(
                        expandedWidget: Hero(
                          tag: widget.transaction.food.name,
                          child: CachedNetworkImage(
                            imageUrl: widget.transaction.food.picturePath,
                            imageBuilder: (ctx, img) => Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: img, fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                        collapsedColor: primaryColor,
                      ),
                      children: [
                        FlexibleTextItem(
                          text: food.name,
                          collapsedStyle: blackFontStyleBig.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 16),
                          expandedStyle:
                              blackFontStyleBig.copyWith(fontSize: 16),
                          expandedPadding: padding,
                          expandedAlignment: Alignment.centerLeft,
                          expandedMargin: const EdgeInsets.only(top: 800),
                          collapsedPadding: const EdgeInsets.only(left: 52),
                          collapsedAlignment: Alignment.centerLeft,
                        ),
                      ],
                    ),
                  ),
                  // SliverAppBar(
                  //   pinned: true,
                  //   backgroundColor: primaryColor,
                  //   expandedHeight: 300.0,
                  //   leading: IconButton(
                  //     iconSize: 44,
                  //     icon: const Icon(Icons.chevron_left_outlined),
                  //     onPressed: () {
                  //       Get.back();
                  //     },
                  //   ),
                  //   flexibleSpace: FlexibleSpaceBar(
                  //     titlePadding: const EdgeInsetsDirectional.only(
                  //         start: 60, bottom: 16),
                  //     title: Text(
                  //       widget.transaction.food.name,
                  //       // style: blackFontStyleBig,
                  //     ),
                  //     background: Stack(
                  //       fit: StackFit.expand,
                  //       children: [
                  //         CachedNetworkImage(
                  //           imageUrl: widget.transaction.food.picturePath,
                  //           imageBuilder: (ctx, img) => Container(
                  //             width: double.infinity,
                  //             decoration: BoxDecoration(
                  //                 image: DecorationImage(
                  //                     image: img, fit: BoxFit.cover)),
                  //           ),
                  //         ),
                  //         const DecoratedBox(
                  //           decoration: BoxDecoration(
                  //             gradient: LinearGradient(
                  //               begin: Alignment(0.0, 0.8),
                  //               end: Alignment(0.0, 0.0),
                  //               colors: <Color>[
                  //                 Color(0x60000000),
                  //                 Color(0x00000000),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        food.name,
                                        softWrap: false,
                                        overflow: TextOverflow.fade,
                                        maxLines: 1,
                                        style: blackFontStyleBig,
                                      ),
                                      RatingStar(
                                        ratingValue: food.rating,
                                        ratingText: food.rating.toString(),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quantity = max(1, quantity - 1);
                                      });
                                    },
                                    child: Container(
                                      height: 36,
                                      width: 36,
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Icon(Icons.remove),
                                    ),
                                  ),
                                  Container(
                                    width: 38,
                                    alignment: Alignment.center,
                                    child: Text(
                                      quantity.toString(),
                                      style: blackFontStyleBig.copyWith(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quantity = min(100, quantity + 1);
                                      });
                                    },
                                    child: Container(
                                      height: 36,
                                      width: 36,
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Icon(Icons.add),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            food.description,
                            style: greyFontStyleMid,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text('Ingredients:',
                              style: blackFontStyleMid.copyWith(fontSize: 18)),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            food.ingredients,
                            style: greyFontStyleMid,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(defaultMargin - 8),
              height: 80,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Price: ', style: greyFontStyleSml),
                      Expanded(
                        child: Text('Rp 12.289.000 ',
                            style: blackFontStyleMid.copyWith(fontSize: 18)),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 160,
                    child: Button(
                        labelText: 'Order Now',
                        onPressed: () {
                          debugPrint('sasd');
                        },
                        style: primaryButton),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

// class NetworkingPageHeader implements SliverPersistentHeaderDelegate {
//   NetworkingPageHeader({
//     this.minExtent,
//     @required this.maxExtent,
//   });
//   final double minExtent;
//   final double maxExtent;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         CachedNetworkImage(
//           imageUrl: "http://via.placeholder.com/350x150",
//           imageBuilder: (ctx, img) => Container(
//             height: 300,
//             width: double.infinity,
//             decoration: BoxDecoration(
//                 image: DecorationImage(image: img, fit: BoxFit.cover)),
//           ),
//         ),
//         Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.transparent, Colors.black54],
//               stops: [0.5, 1.0],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               tileMode: TileMode.clamp,
//             ),
//           ),
//         ),
//         Positioned(
//           left: 16.0,
//           right: 16.0,
//           bottom: 25.0,
//           child: Text(
//             'Lorem ipsum',
//             style: TextStyle(
//               fontSize: 32.0,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   double titleOpacity(double shrinkOffset) {
//     // simple formula: fade out text as soon as shrinkOffset > 0
//     return 1.0 - max(0.0, shrinkOffset) / maxExtent;
//     // more complex formula: starts fading out text when shrinkOffset > minExtent
//     // return 1.0 - max(0.0, (shrinkOffset - minExtent)) / (maxExtent - minExtent);
//   }

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }

//   @override
//   FloatingHeaderSnapConfiguration get snapConfiguration => null;

//   @override
//   // TODO: implement showOnScreenConfiguration
//   PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration =>
//       null;

//   @override
//   // TODO: implement stretchConfiguration
//   OverScrollHeaderStretchConfiguration get stretchConfiguration => null;

//   @override
//   // TODO: implement vsync
//   TickerProvider get vsync => null;
// }
