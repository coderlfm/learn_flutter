import 'package:flutter/material.dart';
import 'package:learn_fluuter_00/douban/main/config.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: tabbar,
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
