import 'package:flutter/material.dart';
import 'package:scan_soft/pages/pallete.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.buttontext,
  }) : super(key: key);

  final String buttontext;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.blue[400], borderRadius: BorderRadius.circular(16)),
      child: FlatButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            buttontext,
            style: kBodyText,
          ),
        ),
      ),
    );
  }
}
