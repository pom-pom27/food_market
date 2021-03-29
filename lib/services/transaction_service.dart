part of 'services.dart';

class TransactionService {
  static Future<ApiReturnValue<List<Transaction>>> getTransactions() async {
    await Future.delayed(const Duration(seconds: 3));
    return ApiReturnValue(value: transactionList);
  }

  ///Untuk submit transaksi ketika malakukan pembelian.
  static Future<ApiReturnValue<Transaction>> submitTransaction(
      Transaction transaction) async {
    await Future.delayed(const Duration(seconds: 2));
    return ApiReturnValue(
      value: transaction.copyWith(id: 123, status: TransactionStatus.pending),
    );
  }
}
