import 'package:flutter/material.dart';

class andreCard extends StatelessWidget {

  final String leftText;
  final String rightText;

  andreCard({required this.leftText, required this.rightText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Row(
        children: [
          Text(leftText),
          Spacer(),
          Text(rightText),
        ],
      ),
    );
  }
}
