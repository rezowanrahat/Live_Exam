import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SizeSelectorApp(),
    );
  }
}

class SizeSelectorApp extends StatefulWidget {
  @override
  _SizeSelectorAppState createState() => _SizeSelectorAppState();
}

class _SizeSelectorAppState extends State<SizeSelectorApp> {
  String selectedSize = '';

  void _showSnackbar(String size) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected Size: $size'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  Widget _buildSizeButton(String size) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedSize = size;
        });
        _showSnackbar(size);
      },
      style: ElevatedButton.styleFrom(
        primary: selectedSize == size ? Colors.green : Colors.black38,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      ),
      child: Text(
        size,
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Size Selector'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSizeButton('S'),
                _buildSizeButton('M'),
                _buildSizeButton('L'),
                _buildSizeButton('XL'),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSizeButton('XXL'),
                _buildSizeButton('XXXL'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
