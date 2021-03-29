part of 'screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key key, this.transaction}) : super(key: key);
  final Transaction transaction;

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    final food = widget.transaction.food;
    final user = widget.transaction.user;

    return GeneralScreen(
        title: "Payment",
        subtitle: 'You deserve better meal',
        onBackButtonPressed: () => Get.back(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Item Ordered",
                    style: blackFontStyleMid,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              height: 60,
                              width: 60,
                              imageUrl: food.picturePath,
                              imageBuilder: (ctx, img) => Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: img, fit: BoxFit.cover),
                                    borderRadius:
                                        BorderRadius.circular(borderRadius)),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      food.name,
                                      softWrap: false,
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                      style: blackFontStyleMid,
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                              symbol: 'Rp ',
                                              decimalDigits: 0,
                                              locale: 'id-ID')
                                          .format(food.price),
                                      style: greyFontStyleSml,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        '${widget.transaction.quantity.toString()} Item',
                        style: greyFontStyleMid,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Details Transaction",
                    style: blackFontStyleMid,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(food.name, style: greyFontStyleMid),
                      Text(
                          NumberFormat.currency(
                                  symbol: 'Rp ',
                                  decimalDigits: 0,
                                  locale: 'id-ID')
                              .format(food.price * widget.transaction.quantity),
                          style: blackFontStyleMid),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Driver', style: greyFontStyleMid),
                      Text(
                          NumberFormat.currency(
                                  symbol: 'Rp ',
                                  decimalDigits: 0,
                                  locale: 'id-ID')
                              .format(50000),
                          style: blackFontStyleMid),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tax 10%', style: greyFontStyleMid),
                      Text(
                          NumberFormat.currency(
                                  symbol: 'Rp ',
                                  decimalDigits: 0,
                                  locale: 'id-ID')
                              .format(food.price *
                                  widget.transaction.quantity *
                                  0.1),
                          style: blackFontStyleMid),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Price', style: greyFontStyleMid),
                      Text(
                          NumberFormat.currency(
                                  symbol: 'Rp ',
                                  decimalDigits: 0,
                                  locale: 'id-ID')
                              .format(
                                  (food.price * widget.transaction.quantity) +
                                      food.price *
                                          (widget.transaction.quantity * 0.1) +
                                      50000),
                          style: blackFontStyleBig),
                    ],
                  ),
                  const SizedBox(
                    height: 56,
                  ),
                  Text(
                    "Details Transaction",
                    style: blackFontStyleMid,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Name', style: greyFontStyleMid),
                      Text(user.name, style: blackFontStyleMid),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Phone No.', style: greyFontStyleMid),
                      Text(user.phoneNumber, style: blackFontStyleMid),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Address', style: greyFontStyleMid),
                      Text(user.address, style: blackFontStyleMid),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('House No.', style: greyFontStyleMid),
                      Text(user.houseNumber, style: blackFontStyleMid),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('City', style: greyFontStyleMid),
                      Text(user.city, style: blackFontStyleMid),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Button(
                    labelText: 'Checkout Now',
                    onPressed: () {},
                    style: primaryButton,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
