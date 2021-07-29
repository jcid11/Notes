import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const boxContentColor = Color(0xFFECEFF1);

class cardContent extends StatelessWidget {
  final int index;
  final Widget card;
  cardContent(this.index, this.card);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: card,
      decoration: BoxDecoration(
          color: boxContentColor, borderRadius: BorderRadius.circular(15)),
    );
  }
}
