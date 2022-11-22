import 'package:flutter/material.dart';
import 'package:lolcard/carddata.dart';
import 'package:lolcard/more_info/select_background.dart';

class SelectLane extends StatefulWidget {
  final CardData data;
  const SelectLane(this.data, {
    Key? key,
    }) : super(key: key);


  @override
  State<SelectLane> createState() => _SelectLaneState();
}

class _SelectLaneState extends State<SelectLane> {
  List<bool> isSelected = <bool>[false,false,false,false,false];

  EnterEvent(){
    if (isSelected.contains(true)){
      switch(isSelected.indexOf(true)){
        case 0:
          widget.data.lane = 'TOP';
          break;
        case 1:
          widget.data.lane = 'MID';
          break;
        case 2:
          widget.data.lane = 'JUG';
          break;
        case 3:
          widget.data.lane = 'SUPP';
          break;
        case 4:
          widget.data.lane = 'ADC';
          break;
      }

      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=> SelectBackground(widget.data))
      );

    }
    else{
      nonLaneDialog(context);
    }
  }

  nonLaneDialog(BuildContext context){
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
          title: Column(
            children: [Text("Failure")],
          ),
          content: Row(
            children: [Text('Please choose your lane')],
          ),
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
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ToggleButtons(
                children: <Widget>[
                  Icon(Icons.ac_unit, size:75),
                  Icon(Icons.call, size:75),
                  Icon(Icons.cake, size:75),
                  Icon(Icons.cake, size:75),
                  Icon(Icons.cake, size:75),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
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
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Choose your lane",
                  style: TextStyle(
                    fontSize: 41,
                  )),

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: ()=>{
                        Navigator.pop(context)
                      },
                      child: Container(
                        child: Text('Cancle'),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: EnterEvent,
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
