import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int people = 0;
  String text = "Pode entrar!";

  void countPeople(int p) {
    setState(() {
      people += p;
      if (people >= 20) {
        text = "Lotado, não pode entrar.";
        people = 20;
      } else if (people < 0) {
        text = "Pode entrar!";
        people = 0;
      } else {
        text = "Pode entrar!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "Images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $people",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(
                    10.0,
                  ),
                  child: TextButton(
                    child: const Text(
                      "+1",
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      countPeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    10.0,
                  ),
                  child: TextButton(
                    child: const Text(
                      "-1",
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      countPeople(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30,
              ),
            )
          ],
        )
      ],
    );
  }
}
