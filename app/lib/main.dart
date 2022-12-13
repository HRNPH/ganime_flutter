import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ganime_Fullbody',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("GANime App"),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              const Text(
                "Generate Anime Girl Using Gan",
                style: TextStyle(
                  fontFamily: 'Kanit',
                  fontSize: 30,
                ),
              ),
              Wrap(
                spacing: 2.0,
                children: <Widget>[Image.asset('assets/images/ruok.png')],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
