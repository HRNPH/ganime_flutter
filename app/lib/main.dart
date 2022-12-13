import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
          backgroundColor: Colors.cyanAccent,
          title: const FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "Generate Anime Girl Using Gan",
              style: TextStyle(
                fontFamily: 'Kanit',
                fontSize: 30,
              ),
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Wrap(
                alignment: WrapAlignment.center,
                direction: Axis.horizontal,
                spacing: 300.0,
                children: <Widget>[
                  const CharacterDisplay(),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Generate Gans Girl!"),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CharacterDisplay extends StatefulWidget {
  const CharacterDisplay({super.key});

  @override
  State<CharacterDisplay> createState() => _CharacterDisplayState();
}

class _CharacterDisplayState extends State<CharacterDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Image.asset('assets/images/placeholder.png'),
      // background colour
    );
  }
}

Future<http.Response> fetchimage() {
  return http.get(
    Uri.parse(
      'https://http://ec2-18-141-159-239.ap-southeast-1.compute.amazonaws.com/api',
    ),
  );
}
