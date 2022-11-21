import 'package:flutter/material.dart';
import 'data_crawling.dart';
import 'package:lolcard/more_info/select_lane.dart';

class InputUsername extends StatefulWidget {
  const InputUsername({Key? key}) : super(key: key);

  @override
  State<InputUsername> createState() => _InputUsernameState();
}

class _InputUsernameState extends State<InputUsername> {
  TextEditingController inputController = TextEditingController();
  String userName = '';
  bool loading = false;
  Map countryMap = {
    'North America' : 'na',
    'Europe West' : 'euw',
    'Europe Nordic & East' : 'eune',
    'Oceania' : 'oce',
    'Korea' : 'kr',
    'Japan' : 'jp',
    'Brazil' : 'br',
    'LAS' : 'las',
    'LAN' : 'lan',
    'Russia' : 'ru',
    'Turkiye' : 'tr'
  };
  String selectCountry = 'Korea';



  LoadingDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 5),child:Text("Loading" )),
        ],),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  FailDialog(BuildContext context, dynamic code){
    String text = 'Null';
    switch (code){
      case -1:
        text = 'Blank';
        break;
      case 0:
        text = 'Except Error (normally network issue)';
        break;
      case 1:
        text = 'op.gg Server Error';
        break;
      case 2:
        text = 'An Unregistered Summoner';
        break;
    }
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
            children: [Text(text)],
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



  EnterEvent() async{
    userName = inputController.text;
    LoadingDialog(context);

    // username이 blank일 때,
    if (userName == '') {
      Navigator.pop(context);
      FailDialog(context, -1);
      return -1;
    }

    // await 붙이면 CardData, 안붙이면 Future<dynamic>
    dynamic data = await dataCrawling(userName, server: countryMap[selectCountry]);

    Navigator.pop(context);

    // if error occur
    if (int.tryParse(data.toString()) != null){
      FailDialog(context, data);
      return int.tryParse(data.toString());
    }

    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> SelectLane(data))
    );
    return data;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[50],
        body: Center(

            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Input your username!',
                    style: TextStyle(
                      fontFamily: 'normal',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,

                    ),

                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Choose Country'),

                    SizedBox(
                      height: 20,
                      width: 20,
                    ),

                    DropdownButton(
                        value: selectCountry,
                        items: countryMap.keys.map((value){
                          return DropdownMenuItem(
                              value: value,
                              child: Text(value));
                        }).toList(),
                        onChanged: (value){
                          setState(() {
                            selectCountry = value as String;
                          });
                        })
                  ],
                ),

                Container(
                    padding: EdgeInsets.all(20.0),
                    child:TextField(
                      controller: inputController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(width: 1, color: Colors.redAccent),
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),

                        labelText: 'username',
                        hintText: 'Enter your username',
                      ),
                    )

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
            )
        )
    );
  }
}
