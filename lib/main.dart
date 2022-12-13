import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'input_username.dart';
import 'app_info.dart';
import 'dart:io';
import 'package:flutter/services.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  sleep(const Duration(seconds: 1));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'LOL Card main',
        home: MainPage(),
        debugShowCheckedModeBanner: false);
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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('LOLCard'),
          centerTitle: true,
          actions: [
            IconButton(onPressed: OpenAppInfo, icon: const Icon(Icons.info))
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: OpenInputUsername, child: const Icon(Icons.add)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  'Make your Card!',
                  style: TextStyle(
                    fontFamily: 'normal',
                    fontSize: width * 0.075,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.1,
              ),
              FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  '1. Click the plus icon in the lower right corner',
                  style: TextStyle(
                    fontFamily: 'normal',
                    fontSize: width * 0.040,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.1,
              ),
              FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  '2. Follow the four steps below.',
                  style: TextStyle(
                    fontFamily: 'normal',
                    fontSize: width * 0.040,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.05,
              ),
              Expanded(child: Image.asset('assets/images/1.png')),
              Expanded(child: Image.asset('assets/images/2.png')),
              Expanded(child: Image.asset('assets/images/3.png')),
              Expanded(child: Image.asset('assets/images/4.png')),
              SizedBox(
                height: width * 0.1,
              ),
              FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  '3. Click the camera icon to save your card',
                  style: TextStyle(
                    fontFamily: 'normal',
                    fontSize: width * 0.040,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Expanded(child: Image.asset('assets/images/5.png')),
            ],
          ),
        ));
  }

  void OpenInputUsername() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => InputUsername()));
  }

  void OpenAppInfo() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AppInfo()));
  }
}
