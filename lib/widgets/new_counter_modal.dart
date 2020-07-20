import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wg_test/widgets/Material_Ink_Button.dart';

class NewCounterModal extends StatelessWidget {
  final Function({@required String title}) onSubmit;

  NewCounterModal({@required this.onSubmit, Key key}) : super(key: key);

  final TextEditingController _newCounterTitleController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 140.0),
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15.0),
            child: TextField(
              controller: _newCounterTitleController,
              onChanged: (String text) {
                // _newCounterTitleController.text = text;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Counter Title',
              ),
            ),
          ),
          Container(
            child: Center(
              child: MaterialInkButtton(
                color: Colors.green,
                splashColor: Colors.greenAccent[400],
                radius: BorderRadius.circular(2.5),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                onTap: () async =>
                    await onSubmit(title: _newCounterTitleController.text),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
