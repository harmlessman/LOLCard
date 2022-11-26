import 'package:flutter/material.dart';
import 'package:lolcard/card_capture.dart';
import 'package:lolcard/cardframe.dart';
import 'package:lolcard/carddata.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class SelectColor extends StatefulWidget {
  const SelectColor(
      {Key? key, required this.cardData, required this.background})
      : super(key: key);

  final CardData cardData;
  final dynamic background;

  @override
  State<SelectColor> createState() => _SelectColorState();
}

class _SelectColorState extends State<SelectColor> {
  Map colorData = {
    'textColor': Colors.black,
    'boxColor': Colors.white,
    'boxTextColor': Colors.black
  };

  Color pickerColor = Colors.white;

  colorDialog(BuildContext context, String target) {
    pickerColor = colorData[target];
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pick a color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
                pickerColor: pickerColor,
                onColorChanged: (color) => {
                      setState(() => {pickerColor = color})
                    }),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Got it'),
              onPressed: () {
                setState(() => colorData[target] = pickerColor);
                Navigator.of(context).pop();
              },
            ),
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'TextColor',
                  style: TextStyle(
                    fontFamily: 'normal',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          colorData['textColor'])),
                  child: Container(),
                  onPressed: () {
                    colorDialog(context, 'textColor');
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'boxColor',
                  style: TextStyle(
                    fontFamily: 'normal',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          colorData['boxColor'])),
                  child: Container(),
                  onPressed: () {
                    colorDialog(context, 'boxColor');
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'boxTextColor',
                  style: TextStyle(
                    fontFamily: 'normal',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          colorData['boxTextColor'])),
                  child: Container(),
                  onPressed: () {
                    colorDialog(context, 'boxTextColor');
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () => {Navigator.pop(context)},
                    child: Container(
                      child: Text('Cancle'),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CardCapture(CardFrame(
                                  cardData: widget.cardData,
                                  background: widget.background,
                                  colorData: colorData))))
                    },
                    child: Container(
                      child: Text('Enter'),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
