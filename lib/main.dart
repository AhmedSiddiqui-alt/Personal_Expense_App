import 'package:flutter/material.dart';
import './widgets/new_transactions.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          backgroundColor: Colors.purple[200],
          primarySwatch: Colors.purple,
          accentColor: Colors.purple[200],
          fontFamily: 'Quicksand',
          textTheme: ThemeData().textTheme.copyWith(
              title: TextStyle(
                  color: Colors.purple,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData().textTheme.copyWith(
                      title: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'OpenSans',
                  )))),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  final List<Transaction> usertransaction = [
    // Transaction(
    //   id: "1",
    //   title: "University Bag",
    //   amount: 2000.00,
    //   date: DateTime.now(),
    //   //  date: DateTime.now().subtract(Duration(days: 7))
    // ),
    // Transaction(
    //     id: "2",
    //     title: "Mobile Pubg Controller",
    //     amount: 347.99,
    //     date: DateTime.now()),
    // Transaction(id: "3", title: "Snacks", amount: 25.00, date: DateTime.now())
  ];
  List<Transaction> get _recentTransaction {
    return usertransaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount, DateTime txDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: txDate);
    setState(() {
      usertransaction.add(newTx);
      print(txTitle);
      print(txAmount);
    });
  }

  void _deleteTransaction(DateTime id) {
    setState(() {
      usertransaction.removeWhere((newtx) {
        return newtx.date == id ? true : false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expense'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    print('I AM HERE');
                    return NewTransaction(_addNewTransaction);
                  });
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Chart(_recentTransaction),
            TransactionList(usertransaction, _deleteTransaction)
            // ...(_Transaction as List<Map<String, Object>>).map((tx) {
            //   return Card(child: Text(tx['title']));
            // }).toList()
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // print('Upun Uper Hai Bhai');
          showModalBottomSheet(
              context: context,
              builder: (context) {
                print('Upun Ander Hai Bhai');
                return NewTransaction(_addNewTransaction);
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
