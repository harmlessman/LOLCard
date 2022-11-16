import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'carddata.dart';
import 'dart:io';

class CardFrame extends StatefulWidget {
  const CardFrame({
    Key? key,
    required this.cardData,
    required this.thema,
      }) : super(key: key);

  final CardData cardData;
  final dynamic thema;

  @override
  State<CardFrame> createState() => _CardFrameState();
}

class _CardFrameState extends State<CardFrame> {
  @override
  Widget build(BuildContext context) {
    return Container(
          width: 500,
          height: 900,
          child: Column(
            children: [

            ],
          ),
          decoration: (widget.thema is XFile) ?
          BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: FileImage((
                  File(widget.thema.path))),
              fit: BoxFit.fill,
            ),
          ) :
          BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: widget.thema
          ),





    );
  }
}
