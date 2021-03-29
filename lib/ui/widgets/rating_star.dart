part of 'widgets.dart';

class RatingStar extends StatelessWidget {
  const RatingStar({
    Key key,
    this.ratingText,
    this.ratingValue,
    this.itemSize = 16.0,
  }) : super(key: key);

  final double ratingValue;
  final double itemSize;
  final String ratingText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBarIndicator(
          rating: ratingValue,
          itemBuilder: (_, i) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemSize: itemSize,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          ratingText,
          style: greyFontStyleSml,
        )
      ],
    );
  }
}
