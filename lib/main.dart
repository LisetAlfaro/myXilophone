import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MyXylophone',
      debugShowCheckedModeBanner: false,
      home: Xylophone(),
    );
  }
}

Widget buildKey({required Color color, required int soundNumber}) {
  return Expanded(
    child: TextButton(
        onPressed: () {
          final player = AudioPlayer();
          player.play(AssetSource('note$soundNumber.wav'));
        },
        style: TextButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: const BorderSide(color: Colors.black))),
        child: const Text('')),
  );
}

class Xylophone extends StatelessWidget {
  const Xylophone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Xylophone',
            style: TextStyle(color: Colors.white),
          )),
      body: SafeArea(
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 60.0),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                buildKey(color: Colors.red, soundNumber: 1),
                buildKey(color: Colors.orange, soundNumber: 2),
                buildKey(color: Colors.yellow, soundNumber: 3),
                buildKey(color: Colors.green, soundNumber: 4),
                buildKey(color: Colors.blue, soundNumber: 5),
                buildKey(color: Colors.purple, soundNumber: 6),
                buildKey(color: Colors.pink, soundNumber: 7),
              ]))), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
