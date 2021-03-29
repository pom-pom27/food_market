part of 'widgets.dart';

class FoodListItem extends StatelessWidget {
  const FoodListItem({Key key, this.food}) : super(key: key);
  final Food food;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: food.picturePath,
            height: 60.0,
            width: 60.0,
            imageBuilder: (ctx, img) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(image: img, fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.name,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                    style: blackFontStyleMid,
                  ),
                  Text(
                    NumberFormat.currency(
                            symbol: 'Rp ', decimalDigits: 0, locale: 'id-ID')
                        .format(food.price),
                    style: greyFontStyleSml,
                  )
                ],
              ),
            ),
          ),
          RatingStar(
            ratingValue: food.rating,
            ratingText: food.rating.toString(),
          ),
        ],
      ),
    );
  }
}
