import 'dart:io';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter/material.dart';
import 'package:lolcard/carddata.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lolcard/card_capture.dart';
import 'package:lolcard/cardframe.dart';

class SelectThema extends StatefulWidget {
  final CardData data;
  const SelectThema(this.data, {Key? key}) : super(key: key);

  @override
  State<SelectThema> createState() => _SelectThemaState();
}

class _SelectThemaState extends State<SelectThema> {
  ImagePicker picker = ImagePicker();
  dynamic thema;
  Color pickerColor = Colors.white;




  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  colorDialog(BuildContext context){
    print(thema);
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
                setState(() => thema  = pickerColor);
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
        thema = getImage;
      }
    });
  }

  EnterEvent(){
    print(thema.runtimeType);
    if (thema != null){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=> CardCapture(CardFrame(cardData : widget.data, thema: thema)))
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
  Widget Preview(dynamic thema){
    if (thema == null){
    return Container(
          child: Text('No Color or Image',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontStyle: FontStyle.normal),
          ),
      );
    }
    else if(thema is XFile){
      // 명함 비율은 9:5
      return Container(
        height: 630.0,
        width: 350.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: FileImage((
              File(thema.path))),
              fit: BoxFit.fill,
          ),
        ),
      );
    }
    else{
      return Container(
        height: 630.0,
        width: 350.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: thema
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
            children: [Text('Please choose your thema')],
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
            Preview(thema),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => {
                    colorDialog(context)
                  },
                  icon: Icon(Icons.color_lens),
                  iconSize: 175,
                ),
                IconButton(
                  onPressed: ImageDialog,
                  icon: Icon(Icons.image),
                  iconSize: 175,

                )
              ],
            ),

            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                  "Choose your thema",
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

        ]
      ),

    )
    );
  }
}
