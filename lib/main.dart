import 'package:clock_app/models/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'enums.dart';
import 'views/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<MenuInfo>(
        create: (context) =>MenuInfo(MenuType.clock),
        child: HomePage(),
      ),
    );
  }
}
