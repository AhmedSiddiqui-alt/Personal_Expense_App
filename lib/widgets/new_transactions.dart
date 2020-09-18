import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate;
  void _presentDatePicker(BuildContext ctx) {
    showDatePicker(
            context: ctx,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((choosenDate) {
      if (choosenDate == null) {
        return;
      } else {
        setState(() {
          _selectedDate = choosenDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          child: TextField(
            decoration: InputDecoration(labelText: 'Title', hintText: 'Title'),
            controller: titleController,
            onSubmitted: (_) {
              if (amountController.text.isEmpty) {
                return;
              }
              final String title = titleController.text;
              final double amount = double.parse(amountController.text);
              if (title.isEmpty || amount < 0) {
                return;
              } else {
                widget.addNewTransaction(title, amount, _selectedDate);
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            child: TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_) {
                if (amountController.text.isEmpty) {
                  return;
                }
                final String title = titleController.text;
                final double amount = double.parse(amountController.text);
                if (title.isEmpty || amount < 0) {
                  return;
                } else {
                  widget.addNewTransaction(title, amount, _selectedDate);
                  Navigator.of(context).pop();
                }
              },
            )),
        Row(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(_selectedDate == null
                    ? 'No Date Choosen'
                    : DateFormat.yMMMEd().format(_selectedDate))),
            FlatButton(
                child: Text('Choose Date'),
                onPressed: () => {_presentDatePicker(context)})
          ],
        ),
        Container(
            alignment: Alignment.centerRight,
            child: Container(
                child: RaisedButton(
              color: Colors.purple[500],
              textColor: Colors.white,
              child: Text(
                'Add Transacton',
                style: TextStyle(
                    // color: Colors.purple[400],
                    ),
                textAlign: TextAlign.right,
              ),
              onPressed: () {
                if (amountController.text.isEmpty) {
                  return;
                }
                final String title = titleController.text;
                final double amount = double.parse(amountController.text);
                if (title.isEmpty || amount < 0) {
                  return;
                } else {
                  widget.addNewTransaction(title, amount, _selectedDate);
                  Navigator.of(context).pop();
                }
              },
            )))
      ],
    ));
  }
}
