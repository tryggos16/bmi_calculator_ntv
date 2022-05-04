import 'package:flutter/material.dart';

class ActionCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onPressed;

  ActionCard({@required this.color, this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: child,
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    );
  }
}
