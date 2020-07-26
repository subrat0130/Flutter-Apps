import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class GenderWidget extends StatefulWidget {
  final IconData genderIcon;
  final String gender;
  GenderWidget(this.genderIcon, this.gender);
  @override
  _GenderWidgetState createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          widget.genderIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          widget.gender,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
