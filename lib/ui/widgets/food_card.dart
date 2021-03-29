part of 'widgets.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    Key key,
    this.food,
    this.onTap,
    this.heroTag,
  }) : super(key: key);

  final Food food;
  final String heroTag;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: onTap,
        child: SizedBox(
          width: 200,
          height: 210,
          child: Column(
            children: [
              Hero(
                tag: heroTag,
                child: CachedNetworkImage(
                  imageUrl: food.picturePath,
                  height: 140,
                  width: 200,
                  fit: BoxFit.cover,
                  fadeOutDuration: const Duration(),
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: borderRadius),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        food.name,
                        style: blackFontStyleMid,
                      ),
                      RatingStar(
                        ratingValue: food.rating,
                        ratingText: food.rating.toString(),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
