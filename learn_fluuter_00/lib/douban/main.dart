import 'package:flutter/material.dart';
import 'package:learn_fluuter_00/douban/main/main.dart';

main() => runApp(
      MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green,
          primarySwatch: Colors.green,
          splashColor: Colors.transparent,
        ),
        home: MainPage(),
      ),
    );
