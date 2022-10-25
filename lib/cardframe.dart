import 'package:flutter/material.dart';
import 'carddata.dart';


class CardFrame extends StatefulWidget {
  const CardFrame({
    Key? key,
    required this.cardData
      }) : super(key: key);

  final CardData cardData;

  @override
  State<CardFrame> createState() => _CardFrameState();
}

class _CardFrameState extends State<CardFrame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          height: 900,
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 7,
                offset: Offset(0, 15),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
