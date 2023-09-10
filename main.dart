import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Profile'),
          centerTitle: true,
          toolbarHeight: 60,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.account_circle, size: 80, color: Colors.green),
              Text('John Doe', style: TextStyle(fontSize: 40, color: Colors.green)),
              Text('Flutter Batch 4', style: TextStyle(fontSize: 24, color: Colors.blue)),
            ],
          ),
        ),
      ),
    );
  }
}
