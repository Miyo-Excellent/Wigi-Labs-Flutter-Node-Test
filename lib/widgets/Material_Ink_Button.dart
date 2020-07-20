import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class MaterialInkButtton extends StatefulWidget {
  final Color color;
  final Color splashColor;
  final Widget child;
  final Function onTap;
  BorderRadiusGeometry radius;
  double size;

  MaterialInkButtton({
    Key key,
    @required this.color,
    @required this.splashColor,
    @required this.child,
    @required this.onTap,
    this.radius,
    this.size,
  }) : super(key: key);

  @override
  _MaterialInkButttonState createState() => _MaterialInkButttonState();
}

class _MaterialInkButttonState extends State<MaterialInkButtton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: widget.radius,
      color: widget.color,
      child: InkWell(
        splashColor: widget.splashColor,
        borderRadius: widget.radius,
        onTap: widget.onTap,
        child: Container(
            width: widget.size,
            height: widget.size,
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: widget.radius,
            ),
            child: widget.child),
      ),
    );
  }
}
