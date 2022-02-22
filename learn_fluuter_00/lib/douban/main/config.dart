import 'package:flutter/material.dart';
import 'package:learn_fluuter_00/douban/profile/profile.dart';
import '../home/home.dart';

List<Widget> pages = [HomePage(), ProfilePage(), ProfilePage(), ProfilePage(), ProfilePage()];

List<BottomNavigationBarItem> tabbar = [
  BottomNavigationBarItem(
    label: '首页',
    icon: Image.asset('lib/assets/images/tabbar/home.png', width: 30, gaplessPlayback: true),
    activeIcon: Image.asset('lib/assets/images/tabbar/home_active.png', width: 30, gaplessPlayback: true),
  ),
  BottomNavigationBarItem(
    label: '书影音',
    icon: Image.asset('lib/assets/images/tabbar/subject.png', width: 30, gaplessPlayback: true),
    activeIcon: Image.asset('lib/assets/images/tabbar/subject_active.png', width: 30, gaplessPlayback: true),
  ),
  BottomNavigationBarItem(
    label: '小组',
    icon: Image.asset('lib/assets/images/tabbar/group.png', width: 30, gaplessPlayback: true),
    activeIcon: Image.asset('lib/assets/images/tabbar/group_active.png', width: 30, gaplessPlayback: true),
  ),
  BottomNavigationBarItem(
    label: '市集',
    icon: Image.asset('lib/assets/images/tabbar/mall.png', width: 30, gaplessPlayback: true),
    activeIcon: Image.asset('lib/assets/images/tabbar/mall_active.png', width: 30, gaplessPlayback: true),
  ),
  BottomNavigationBarItem(
    label: '我的',
    icon: Image.asset('lib/assets/images/tabbar/profile.png', width: 30, gaplessPlayback: true),
    activeIcon: Image.asset('lib/assets/images/tabbar/profile_active.png', width: 30, gaplessPlayback: true),
  ),
];
