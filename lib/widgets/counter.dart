import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wg_test/models/counter.dart';
import 'package:wg_test/widgets/Material_Ink_Button.dart';

class Counter extends StatelessWidget {
  final CounterModel data;
  final Function onInc;
  final Function onDec;
  final Function onDrop;

  Counter({
    @required this.data,
    @required this.onInc,
    @required this.onDec,
    @required this.onDrop,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            data.title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          children: [
            Text("${data.count}"),
            SizedBox(width: 10.0),
            MaterialInkButtton(
              color: Colors.white,
              splashColor: Colors.orangeAccent,
              size: 30.0,
              radius: BorderRadius.circular(15.0),
              onTap: onDec,
              child: Container(
                decoration: BoxDecoration(),
                child: Center(
                  child: Icon(
                    Icons.remove,
                    color: Colors.orange,
                    size: 20.0,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.0),
            MaterialInkButtton(
              color: Colors.white,
              splashColor: Colors.lightGreenAccent,
              size: 30.0,
              radius: BorderRadius.circular(15.0),
              onTap: onInc,
              child: Container(
                decoration: BoxDecoration(),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.lightGreen,
                    size: 20.0,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.0),
            MaterialInkButtton(
              color: Colors.white,
              splashColor: Colors.redAccent,
              size: 30.0,
              radius: BorderRadius.circular(15.0),
              onTap: onDrop,
              child: Container(
                decoration: BoxDecoration(),
                child: Center(
                  child: Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                    size: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
