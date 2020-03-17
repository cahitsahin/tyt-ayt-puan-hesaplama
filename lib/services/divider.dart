import 'package:flutter/material.dart';

class CustomDivider extends StatefulWidget {
  CustomDivider({Key key, this.dividerText}) : super(key: key);

  final String dividerText;

  @override
  _CustomDividerState createState() => _CustomDividerState();
}


class _CustomDividerState extends State<CustomDivider> {

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: Divider(
              color: Colors.black,
              height: 50,
            )),
      ),
      Text(widget.dividerText),
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: Divider(
              color: Colors.black,
              height: 50,
            )),
      ),
    ]);
  }
}
