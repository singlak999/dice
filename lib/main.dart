import 'dart:math';

import 'package:flutter/material.dart';
int getRandom(){
  return 1+Random().nextInt(6);
}

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Dicee',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.redAccent,
        ),
        body: dicePage(),
      ),
    ),
  );
}

class dicePage extends StatefulWidget {
  const dicePage({super.key});

  @override
  State<dicePage> createState() => _dicePageState();
}

class _dicePageState extends State<dicePage> {
  int leftdiceno = 1;
  int rightdiceno = 5;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      leftdiceno = getRandom();
                    });
                  },
                  child: Image.asset('images/dice$leftdiceno.png'),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  flex: 1,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          rightdiceno = getRandom();
                        });
                      },
                      child: Image.asset('images/dice$rightdiceno.png'))),
            ],
          ),
          TextButton(
              onPressed: () {},
              child:  TextButton(
                child: const SizedBox(
                  width: 150,
                  child: Card(
                    color: Colors.black,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0,5,0,5),
                        child: Text(
                          'Roll both dice',
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ), onPressed: (){
                  setState(() {
                    rightdiceno=getRandom();
                    leftdiceno=getRandom();
                  });
              },
              ))
        ],
      ),
    );
  }
}
