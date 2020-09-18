import 'package:flutter/material.dart';

class ChartBars extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentage;
  ChartBars(this.label, this.spendingAmount, this.spendingPercentage);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('\$ ${spendingAmount.toStringAsFixed(0)}'),
        SizedBox(
          height: 6,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10),
                // color: Color.fromRGBO(220, 220, 220, 1),
              ),
            ),
            FractionallySizedBox(
              heightFactor: spendingPercentage,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.purple[300],
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ]),
        ),
        SizedBox(
              height: 6,
            ),
            Text(label),
      ],
    );
  }
}
