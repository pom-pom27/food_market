part of 'widgets.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({Key key, this.transaction}) : super(key: key);
  final Transaction transaction;

  Food get _food => transaction.food;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: _food.picturePath,
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
                      _food.name,
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.fade,
                      style: blackFontStyleMid,
                    ),
                    Row(
                      children: [
                        Text('${transaction.quantity} Item • ',
                            style: greyFontStyleSml),
                        Text(
                          NumberFormat.currency(
                                  symbol: 'Rp ',
                                  decimalDigits: 0,
                                  locale: 'id-ID')
                              .format(transaction.total),
                          style: greyFontStyleSml,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  DateFormat("MMM M, H:m").format(transaction.dateTime),
                  style: greyFontStyleSml,
                ),
                Text(
                  transaction.status['name'],
                  style: greyFontStyleSml.copyWith(
                    fontSize: 12,
                    color: transaction.status['color'].toColor(),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
