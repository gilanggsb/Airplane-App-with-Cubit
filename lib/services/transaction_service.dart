import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/models/user_model.dart';
import 'package:airplane/services/user_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  final CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(
      TransactionModel transaction, UserModel user) async {
    try {
      if (user.balance >= transaction.grandTotal) {
        final userBalance = user.balance - transaction.grandTotal;
        await UserService().updateBalance(user, userBalance);
        _transactionReference.add({
          'destinations': transaction.destination.toJson(),
          'amountOfTraveler': transaction.amountOfTraveler,
          'selectedSeats': transaction.selectedSeats,
          'insurance': transaction.insurance,
          'refundable': transaction.refundable,
          'vat': transaction.vat,
          'price': transaction.price,
          'grandTotal': transaction.grandTotal,
        });
      }else{
        throw 'Saldo Tidak Cukup';
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TransactionModel>> fetchTransactions() async {
    try {
      QuerySnapshot result = await _transactionReference.get();
      print('ini transaction service ${result.docs}');

      List<TransactionModel> transactions = result.docs.map(
        (e) {
          return TransactionModel.fromJson(
              e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();

      return transactions;
    } catch (e) {
      rethrow;
    }
  }
}
