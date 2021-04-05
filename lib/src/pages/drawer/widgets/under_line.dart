import 'package:flutter/material.dart';

class UnderLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(4.0, 16.0, 12.0, 16.0),
      child: Divider(
        color: Theme.of(context).textTheme.headline4.color,
        height: .05,
        thickness: .05,
      ),
    );
  }
}
