part of 'screen.dart';

class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({Key key, this.onBackPress, this.transaction})
      : super(key: key);

  final void Function() onBackPress;
  final Transaction transaction;

  @override
  _FoodDetailScreenState createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: widget.transaction.food.picturePath,
                        imageBuilder: (ctx, img) => Container(
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: img, fit: BoxFit.cover)),
                        ),
                      ),
                      Positioned(
                        top: 24,
                        left: 16,
                        height: 44,
                        width: 44,
                        child: GestureDetector(
                          onTap: () {
                            debugPrint('xcxcvx');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Icon(Icons.chevron_left_rounded),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24, horizontal: 16),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                        ),
                        margin: const EdgeInsets.only(top: 270),
                        height: 800,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.transaction.food.name,
                                  style: blackFontStyleBig,
                                ),
                                Text(
                                  widget.transaction.food.price.toString(),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
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
          ),
        ),
      ),
    );
  }
}
