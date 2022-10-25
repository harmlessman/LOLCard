import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'carddata.dart';
import 'dart:convert';
import 'input_username.dart';
import 'setting.dart';
import 'cardframe.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  FlutterNativeSplash.remove();


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'LOL Card main',
        home:MainPage()

    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('LOL Card'),
          centerTitle: true,
          actions: [IconButton(onPressed: OpenSet, icon: Icon(Icons.settings))],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: OpenInputUsername,
            child: Icon(Icons.add)
        )

    );
  }

  void OpenInputUsername(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> InputUsername())
    );
  }

  // 이건 cardframe 테스트용입니다.
  var a = CardData();
  void OpenSet(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> CardFrame(cardData: a))
    );
  }
}

