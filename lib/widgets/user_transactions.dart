// import 'package:flutter/material.dart';
// import '../widgets/transaction_list.dart';
// import '../widgets/new_transactions.dart';
// import '../models/transaction.dart';

// class UserTransaction extends StatefulWidget {
//   @override
//   _UserTransactionState createState() {
//     return _UserTransactionState();
//   }
// }

// class _UserTransactionState extends State<UserTransaction> {
//   final List<Transaction> usertransaction = [
//     Transaction(
//         id: "1",
//         title: "University Bag",
//         amount: 2000.00,
//         date: DateTime.now()),
//     // Transaction(
//     //     id: "2",
//     //     title: "Mobile Pubg Controller",
//     //     amount: 347.99,
//     //     date: DateTime.now()),
//     // Transaction(id: "3", title: "Snacks", amount: 25.00, date: DateTime.now())
//   ];

//   void _addNewTransaction(String txTitle, double txAmount) {
//     final newTx = Transaction(
//         id: DateTime.now().toString(),
//         title: txTitle,
//         amount: txAmount,
//         date: DateTime.now());
//     setState(() {
//       usertransaction.add(newTx);
//       print(txTitle);
//       print(txAmount);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         NewTransaction(_addNewTransaction),
//         TransactionList(usertransaction)
//       ],
//     );
//   }
// }
