import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我的收藏')),
      body: Center(
        child: Text('收藏'),
      ),
    );
  }
}
