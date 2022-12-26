import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart'; // for open url

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // create image widget
  Image imageWidget = Image.asset('assets/images/placeholder.png');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Wrap(
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  spacing: 300.0,
                  children: <Widget>[
                    Container(
                      // increase image size width to 80% of screen
                      width: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
                      margin: const EdgeInsets.only(top: 20),
                      child: imageWidget,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          // get image from http request
                          String image;
                          fetchimage().then(
                            (respond) => {
                              image = respond.body,
                              // extract json from respond
                              image = jsonDecode(respond.body)['image'],
                              // set image widget (base 64 decode)
                              setState(() {
                                imageWidget = Image.memory(
                                  base64Decode(image),
                                  fit: BoxFit.fill,
                                );
                              }),
                            },
                          );
                        },
                        child: const Text("Generate Gans Girl!"),
                      ),
                    ),
                    Credit(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Credit extends StatelessWidget {
  Credit({super.key});
  // linking to project github

  final Uri _projectmedium = Uri.parse(
    'https://medium.com/@hrnph/%E0%B8%A7%E0%B8%B2%E0%B8%94%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%95%E0%B8%B1%E0%B8%A7%E0%B8%A5%E0%B8%B0%E0%B8%84%E0%B8%A3%E0%B8%AD%E0%B8%99%E0%B8%B4%E0%B9%80%E0%B8%A1%E0%B8%B0%E0%B8%AA%E0%B8%B2%E0%B8%A7%E0%B9%86-%E0%B9%81%E0%B8%9A%E0%B8%9A%E0%B9%80%E0%B8%95%E0%B9%87%E0%B8%A1%E0%B8%95%E0%B8%B1%E0%B8%A7-%E0%B8%94%E0%B9%89%E0%B8%A7%E0%B8%A2-deep-learning-ganime-fullbody-9b3822e58934',
  );
  final Uri _aibuildersweb = Uri.parse('https://ai-builders.github.io/');

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      // Credit
      child: Wrap(
        // center credit
        alignment: WrapAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  launchUrl(_aibuildersweb);
                },
                child: Image.asset(
                  'assets/images/aibuilders.webp',
                  width: 100,
                ),
              ),
              const Text(
                'a program for kids who want to build good AI',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          Container(
            // top margin
            margin: const EdgeInsets.only(top: 10),
          ),
          Image.asset(
            'assets/images/sponser.webp',
            width: 500,
          ),
          GestureDetector(
            onTap: () {
              launchUrl(_projectmedium);
            },
            child: Image.asset(
              'assets/images/medium.png',
              width: 400,
            ),
          ),
        ],
      ),
    );
  }
}

// Use to get image from http request
Future<http.Response> fetchimage() async {
  return await http.get(
    Uri.parse(
      'http://18.141.159.239/api',
    ),
  );
}
