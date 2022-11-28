import 'dart:math';

import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  static const String id = 'dice';

  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  final maxValue = 6;
  final random = Random();
  int _counter1 = 1;
  int _counter2 = 1;

  void _incrementCounter() {
    setState(() {
      final randomNumber1 = random.nextInt(maxValue);
      final randomNumber2 = random.nextInt(maxValue);
      _counter1 = randomNumber1 + 1;

      _counter2 = randomNumber2 + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dados e desestress'),
        ),
        backgroundColor: const Color.fromARGB(255, 13, 219, 237),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image
                  Image.asset(
                    'lib/assets/dice$_counter1.png',
                    width: 160,
                    // height: 60,
                    color: Colors.pinkAccent,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/assets/dice$_counter2.png',
                    width: 160,
                    //height: 100,
                    color: Colors.amberAccent,
                    fit: BoxFit.contain,
                    // style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ],
          ),
          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
