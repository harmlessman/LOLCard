import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'input_username.dart';
import 'setting.dart';
import 'dart:io';


void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  sleep(const Duration(seconds:1));
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


  void OpenSet(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> Setting())
    );
  }
}

