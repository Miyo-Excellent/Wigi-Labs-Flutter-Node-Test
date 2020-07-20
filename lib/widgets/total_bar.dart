import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wg_test/models/counter.dart';

class TotalBar extends StatelessWidget {
  final List<CounterModel> counters;

  TotalBar({@required this.counters, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int _total = counters.fold(
        0, (int acc, CounterModel element) => acc + element.count);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.only(
        right: 25.0,
        left: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: Text(
              'Total:',
              style: TextStyle(
                color: Color.fromRGBO(40, 40, 40, 1.0),
                fontSize: 24.0,
              ),
            ),
          ),
          Container(
            child: Text(
              "$_total",
              style: TextStyle(
                color: Color.fromRGBO(40, 40, 40, 1.0),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
