import 'dart:io';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter/material.dart';
import 'package:lolcard/carddata.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lolcard/card_capture.dart';
import 'package:lolcard/cardframe.dart';

class SelectBackground extends StatefulWidget {
  final CardData data;
  const SelectBackground(this.data, {Key? key}) : super(key: key);

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

  colorDialog(BuildContext context){
    print(background);
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
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
                setState(() => background  = pickerColor);
                Navigator.of(context).pop();

              },
            ),
          ],
        );
      },
    );
  }



  ImageDialog() async{
    final getImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (getImage!=null) {
        background = getImage;
      }
    });
  }

  EnterEvent(){
    print(background.runtimeType);
    if (background != null){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=> CardCapture(CardFrame(cardData : widget.data, background: background)))
      );
    }
    else{
      nonLaneDialog(context);
    }
    return 0;
  }
  // image == null ? Text('Your Thema') : Image.file(
  // File(image.path),
  // width: 100,
  // height: 100,
  // ),
  Widget Preview(dynamic background){
    if (background == null){
    return Container(
          child: Text('No Color or Image',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontStyle: FontStyle.normal),
          ),
      );
    }
    else if(background is XFile){
      // 명함 비율은 9:5
      return Container(
        height: (MediaQuery.of(context).size.width)*0.6*1.8,
        width: (MediaQuery.of(context).size.width)*0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: FileImage((
              File(background.path))),
              fit: BoxFit.fill,
          ),
        ),
      );
    }
    else{
      return Container(
        height: (MediaQuery.of(context).size.width)*0.6*1.8,
        width: (MediaQuery.of(context).size.width)*0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: background
        ),
      );
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
            children: [Text('Please choose your background')],
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
      body: Center(
        child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Preview(background),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => {
                    colorDialog(context)
                  },
                  icon: Icon(Icons.color_lens),
                  iconSize: 150,
                ),
                IconButton(
                  onPressed: ImageDialog,
                  icon: Icon(Icons.image),
                  iconSize: 150,

                )
              ],
            ),

            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                  "Choose your background",
                  style: TextStyle(
                    fontSize: 36,
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

        ]
      ),

    )
    );
  }
}
