import 'package:flutter/material.dart';

class InputUsername extends StatefulWidget {
  const InputUsername({Key? key}) : super(key: key);

  @override
  State<InputUsername> createState() => _InputUsernameState();
}

class _InputUsernameState extends State<InputUsername> {
  TextEditingController inputController = TextEditingController();
  String? userName;

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
                      fontSize: 41,
                    ),

                  ),
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
                        onPressed: ()=>{
                          userName = inputController.text,
                          print(userName)

                        },
                        child: Container(
                          child: Text('Enter'),
                        ),
                      ),
                    )
                  ],
                )

              ],
            )

        )
    );
  }
}
