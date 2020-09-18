import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function _deleteTransaction;
  TransactionList(this.transaction, this._deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: transaction.isEmpty
            ? Column(
                children: <Widget>[
                  Text('No Transactions'),
                  SizedBox(height: 40),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            child: Padding(
                                padding: EdgeInsets.all(5),
                                child: FittedBox(
                                    child: Text(
                                        '\$${transaction[index].amount}'))),
                          ),
                          title: Text(transaction[index].title),
                          subtitle: Text(DateFormat.yMMMEd()
                              .format(transaction[index].date)),
                          trailing: IconButton(
                              color: Colors.red,
                              icon: Icon(Icons.delete),
                              onPressed: () => {
                                    _deleteTransaction(transaction[index].date)
                                  })));
                },
                itemCount: transaction.length,
              ));
  }
}
