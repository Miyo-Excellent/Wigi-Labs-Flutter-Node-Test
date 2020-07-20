import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Modal {
  static void show({
    String title = "Create new counter",
    @required BuildContext context,
    @required Widget child,
  }) async {
    return await showDialog(
      context: context,
      builder: (BuildContext _) => AlertDialog(
        title: Text(title),
        content: child,
      ),
    );
  }
}
