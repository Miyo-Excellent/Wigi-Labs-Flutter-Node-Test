import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackBar {
  static void show({@required BuildContext context, @required Widget child}) {
    showModalBottomSheet(context: context, builder: (builder) => child);
  }
}
