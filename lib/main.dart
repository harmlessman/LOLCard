import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'dataformat.dart';
import 'dart:convert';


void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  FlutterNativeSplash.remove();
  CardData card = CardData();
  CardData card2 = CardData();
  print(card);
  card.userName = "";
  card2.userName = "";
  dynamic l = [card.toJson(), card2.toJson()];
  print(l);


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOL Card main',

    );
  }
}


