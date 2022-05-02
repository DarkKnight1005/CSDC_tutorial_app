import 'package:flutter/material.dart';

class LabelBox extends StatelessWidget {

  final String text;
  final double fontSize;
  final double borderRadius;

  const LabelBox({
    Key? key,
    required this.text,
    this.fontSize = 20,
    this.borderRadius = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(this.borderRadius)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 20,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Text(
          this.text,
          style: TextStyle(
            fontSize: this.fontSize,
            color: Colors.grey[900],
          ),
        ),
      ),
    );
  }
}