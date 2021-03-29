part of 'model.dart';

class TransactionStatus {
  static const delivered = {'name': 'Delivered', 'color': '#020202'};
  static const onDelivery = {'name': 'On Delivery', 'color': '#1ABC9C'};
  static const pending = {'name': 'Pending', 'color': '#FFA000'};
  static const canceled = {'name': 'Canceled', 'color': '#D9435E'};
}

class Transaction extends Equatable {
  final int id;
  final Food food;
  final int quantity;
  final int total;
  final DateTime dateTime;
  final Map<String, String> status;
  final User user;

  const Transaction(
      {this.id,
      this.food,
      this.quantity,
      this.total,
      this.dateTime,
      this.status,
      this.user});

  Transaction copyWith({
    int id,
    Food food,
    int quantity,
    int total,
    DateTime dateTime,
    Map<String, String> status,
    User user,
  }) =>
      Transaction(
        id: id ?? this.id,
        food: food ?? this.food,
        quantity: quantity ?? this.quantity,
        total: total ?? this.total,
        dateTime: dateTime ?? this.dateTime,
        status: status ?? this.status,
        user: user ?? this.user,
      );

  @override
  List<Object> get props => [id, food, quantity, total, dateTime, status, user];
}

int ongkosKirim = 50000;

final transactionList = [
  Transaction(
    id: 1,
    food: listFood[0],
    quantity: 10,
    total: (listFood[0].price * 10 * 1.1).round() + ongkosKirim,
    dateTime: DateTime.now(),
    status: TransactionStatus.delivered,
    user: userDummy,
  ),
  Transaction(
    id: 2,
    food: listFood[1],
    quantity: 2,
    total: (listFood[1].price * 2 * 1.1).round() + ongkosKirim,
    dateTime: DateTime.now(),
    status: TransactionStatus.onDelivery,
    user: userDummy,
  ),
  Transaction(
    id: 3,
    food: listFood[2],
    quantity: 6,
    total: (listFood[2].price * 6 * 1.1).round() + ongkosKirim,
    dateTime: DateTime.now(),
    status: TransactionStatus.canceled,
    user: userDummy,
  ),
  Transaction(
    id: 4,
    food: listFood[3],
    quantity: 6,
    total: (listFood[2].price * 6 * 1.1).round() + ongkosKirim,
    dateTime: DateTime.now(),
    status: TransactionStatus.pending,
    user: userDummy,
  ),
];
