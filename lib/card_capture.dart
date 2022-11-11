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
    try{
      await ImageGallerySaver.saveImage(image);
      print("File Saved to Gallery");
      DoneDialog(context, 'Done!');
    }
    catch(e){
      print("Failed to save file to gallery");
      DoneDialog(context, e.toString());
    }
  }



  DoneDialog(BuildContext context, String text){
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
          title: Column(
            children: [Text(text)],
          ),
          // content: Row(
          //   children: [Text('done!')],
          // ),
          actions: [
            TextButton(
              onPressed: ()=>{
                Navigator.pop(context)
              },
              child: Text("OK"),
            )
          ],
        );
      },
    );
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              widget.frame,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: ()=>{
                      Navigator.of(context).pop()
                    },
                    icon: Icon(Icons.arrow_back),
                    iconSize: 75,
                  ),
                  IconButton(
                    onPressed: ()=>{
                      Navigator.popUntil(context, ModalRoute.withName("/"))
                    },
                    icon: Icon(Icons.home),
                    iconSize: 75,
                  ),
                  IconButton(
                    onPressed: (){
                      var container = Container(
                        child: widget.frame,
                      );
                      screenshotController
                          .captureFromWidget(
                          InheritedTheme.captureAll(
                              context, Material(child: container)),
                          delay: Duration(seconds: 1))
                          .then((capturedImage) {
                            print(capturedImage);
                            Saved(capturedImage);
                      });
                    },
                    icon: Icon(Icons.camera_alt),
                    iconSize: 75,
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}
