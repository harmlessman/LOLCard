import 'package:flutter/material.dart';
import 'cardframe.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:typed_data';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class CardCapture extends StatefulWidget {
  final CardFrame frame;

  const CardCapture(this.frame, {Key? key}) : super(key: key);

  @override
  State<CardCapture> createState() => _CardCaptureState();
}

class _CardCaptureState extends State<CardCapture> {
  ScreenshotController screenshotController = ScreenshotController();

  Saved(Uint8List image) async {
    try {
      await ImageGallerySaver.saveImage(image);
      DoneDialog(context, 'Done!');
    } catch (e) {
      DoneDialog(context, e.toString());
    }
  }

  DoneDialog(BuildContext context, String text) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Column(
            children: [Text(text)],
          ),
          actions: [
            TextButton(
              onPressed: () => {Navigator.pop(context)},
              child: Text("OK"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Screenshot(
            controller: screenshotController,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: widget.frame,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => {Navigator.of(context).pop()},
                icon: Icon(Icons.arrow_back),
                iconSize: width * 0.15,
              ),
              IconButton(
                onPressed: () =>
                    {Navigator.popUntil(context, ModalRoute.withName("/"))},
                icon: Icon(Icons.home),
                iconSize: width * 0.15,
              ),
              IconButton(
                onPressed: () {
                  screenshotController.capture().then((Uint8List? image) {
                    Saved(image!);
                  });
                },
                icon: Icon(Icons.camera_alt),
                iconSize: width * 0.15,
              ),
            ],
          )
        ],
      ),
    ));
  }
}
