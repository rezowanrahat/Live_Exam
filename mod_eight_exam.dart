import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Thumbnail Feed'),
        ),
        body: ThumbnailGrid(),
      ),
    );
  }
}

class ThumbnailGrid extends StatelessWidget {
  static const List<String> imageLink = [
    'https://images.pexels.com/photos/2173872/pexels-photo-2173872.jpeg?auto=compress&cs=tinysrgb&w=1600',
    'https://images.pexels.com/photos/982299/pexels-photo-982299.jpeg?auto=compress&cs=tinysrgb&w=1600',
    'https://images.pexels.com/photos/3155894/pexels-photo-3155894.jpeg?auto=compress&cs=tinysrgb&w=1600',
    'https://images.pexels.com/photos/1687831/pexels-photo-1687831.jpeg?auto=compress&cs=tinysrgb&w=1600',
    'https://images.pexels.com/photos/3216568/pexels-photo-3216568.jpeg?auto=compress&cs=tinysrgb&w=1600',
    'https://images.pexels.com/photos/1835007/pexels-photo-1835007.jpeg?auto=compress&cs=tinysrgb&w=1600'
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 1 : 2,
      ),
      itemCount: imageLink.length,
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Image.network(imageLink[index]),
          ),
        );
      },
    );
  }
}
