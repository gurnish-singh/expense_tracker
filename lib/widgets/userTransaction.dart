import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/newTransaction.dart';
import 'package:expense_tracker/widgets/transactionList.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
   final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New shoes',
      amount: 50,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Groceries',
      amount: 40,
      date: DateTime.now(),
    ),
  ];
  void _addNew(String title, double amount) {
    final newTx = Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),//temporary
    );
    // now we need to add it to the parent transaction list;
    setState(() {
      transactions.add(newTx);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        /////////////////// text fields for title and amount ////
        NewTransaction(_addNew),
        ///////////////////////transaction thing /////////////////////////////////////
        TransactionList(transactions),
      ],
    );
  }
}
