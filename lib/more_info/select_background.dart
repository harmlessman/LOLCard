import 'dart:io';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter/material.dart';
import 'package:lolcard/carddata.dart';
import 'package:image_picker/image_picker.dart';
import 'select_color.dart';

class SelectBackground extends StatefulWidget {
  final CardData cardData;

  const SelectBackground(this.cardData, {Key? key}) : super(key: key);

  @override
  State<SelectBackground> createState() => _SelectBackgroundState();
}

class _SelectBackgroundState extends State<SelectBackground> {
  ImagePicker picker = ImagePicker();
  dynamic background;
  Color pickerColor = Colors.white;

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  colorDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pick a color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: changeColor,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Got it'),
              onPressed: () {
                setState(() => background = pickerColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  ImageDialog() async {
    final getImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (getImage != null) {
        background = getImage;
      }
    });
  }

  EnterEvent() {
    if (background != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SelectColor(
                    cardData: widget.cardData,
                    background: background,
                  )));
    } else {
      nonLaneDialog(context);
    }
    return 0;
  }

  Widget Preview(dynamic background) {
    double width = MediaQuery.of(context).size.width;
    if (background == null) {
      return FittedBox(
        fit: BoxFit.cover,
        child: Text(
          "No Color or Image",
          style: TextStyle(
            fontFamily: 'normal',
            fontSize: width * 0.075,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else if (background is XFile) {
      // 명함 비율은 9:5
      return Container(
        height: width * 0.6 * 1.8,
        width: width * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: FileImage((File(background.path))),
            fit: BoxFit.fill,
          ),
        ),
      );
    } else {
      return Container(
        height: width * 0.6 * 1.8,
        width: width * 0.6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: background),
      );
    }
  }

  nonLaneDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Column(
            children: [Text("Failure")],
          ),
          content: Row(
            children: [Text('Please choose your background')],
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
            Preview(background),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => {colorDialog(context)},
                  icon: Icon(Icons.color_lens),
                  iconSize: width * 0.3,
                ),
                IconButton(
                  onPressed: ImageDialog,
                  icon: Icon(Icons.image),
                  iconSize: width * 0.3,
                )
              ],
            ),
            FittedBox(
              fit: BoxFit.cover,
              child: Text(
                "Choose your background",
                style: TextStyle(
                  fontFamily: 'normal',
                  fontSize: width * 0.075,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () => {Navigator.pop(context)},
                    style: ElevatedButton.styleFrom(minimumSize: Size(80, 40)),
                    child: Text('Cancle'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: EnterEvent,
                    style: ElevatedButton.styleFrom(minimumSize: Size(80, 40)),
                    child: Text('Enter'),
                  ),
                ),
              ],
            )
          ]),
    ));
  }
}
