part of 'screen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  var _selectedIndex = 0;

  final List<Transaction> inProgress = transactionList
      .where((e) =>
          e.status == TransactionStatus.onDelivery ||
          e.status == TransactionStatus.pending)
      .toList();
  final List<Transaction> pastOrders = transactionList
      .where((e) =>
          e.status == TransactionStatus.delivered ||
          e.status == TransactionStatus.canceled)
      .toList();

  static const tabTitles = ['In Progress', 'Past Orders'];

  Widget _mapOrder(Transaction e) => OrderListItem(transaction: e);

  @override
  Widget build(BuildContext context) {
    return GeneralScreen(
      title: 'Your Orders',
      subtitle: 'Wait for the best meal',
      child: Column(
        children: [
          CustomTabBar(
            titles: tabTitles,
            selectedIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _selectedIndex == 0
                  ? inProgress.map(_mapOrder).toList()
                  : pastOrders.map(_mapOrder).toList(),
            ),
          )
        ],
      ),
    );
  }
}
