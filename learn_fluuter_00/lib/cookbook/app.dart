import 'package:flutter/material.dart';
import './pages/home/home.dart';
import './pages/favorite/favorite.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: bottomNavigationBarItems,
        onTap: (index) => setState(() => _currentIndex = index),
        unselectedFontSize: 14,
        selectedFontSize: 14,
      ),
    );
  }
}

// 页面
final List<Widget> pages = [HomePage(), FavoritePage()];

// 底部 tabbar
final List<BottomNavigationBarItem> bottomNavigationBarItems = [
  BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
  BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '收藏'),
];
