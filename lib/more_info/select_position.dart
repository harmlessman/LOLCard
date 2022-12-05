import 'package:flutter/material.dart';
import 'package:lolcard/carddata.dart';
import 'package:lolcard/more_info/select_background.dart';

class SelectPosition extends StatefulWidget {
  final CardData cardData;

  const SelectPosition(
    this.cardData, {
    Key? key,
  }) : super(key: key);

  @override
  State<SelectPosition> createState() => _SelectPositionState();
}

class _SelectPositionState extends State<SelectPosition> {
  List<bool> isSelected = <bool>[false, false, false, false, false];

  EnterEvent() {
    if (isSelected.contains(true)) {
      switch (isSelected.indexOf(true)) {
        case 0:
          widget.cardData.lane = 'TOP';
          break;
        case 1:
          widget.cardData.lane = 'MID';
          break;
        case 2:
          widget.cardData.lane = 'JUG';
          break;
        case 3:
          widget.cardData.lane = 'BOT';
          break;
        case 4:
          widget.cardData.lane = 'SUP';
          break;
      }

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SelectBackground(widget.cardData)));
    } else {
      nonLaneDialog(context);
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
            children: [Text('Please choose your position')],
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
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ToggleButtons(
              //fillColor : Colors.lightBlueAccent,
              children: <Widget>[
                Image.asset(
                  'assets/positions/position_top.png',
                  width: width * 0.15,
                ),
                Image.asset(
                  'assets/positions/position_mid.png',
                  width: width * 0.15,
                ),
                Image.asset(
                  'assets/positions/position_jug.png',
                  width: width * 0.15,
                ),
                Image.asset(
                  'assets/positions/position_bot.png',
                  width: width * 0.15,
                ),
                Image.asset(
                  'assets/positions/position_sup.png',
                  width: width * 0.15,
                ),
              ],
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < isSelected.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      isSelected[buttonIndex] = !isSelected[buttonIndex];
                    } else {
                      isSelected[buttonIndex] = false;
                    }
                  }
                });
              },
              isSelected: isSelected,
            ),
            SizedBox(
              height: 20,
            ),
            FittedBox(
              fit: BoxFit.cover,
              child: Text("Choose your position",
                  style: TextStyle(
                    fontSize: width * 0.075,
                    fontFamily: 'normal',
                    //fontWeight: FontWeight.bold,
                  )),
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
          ],
        ),
      ),
    );
  }
}
