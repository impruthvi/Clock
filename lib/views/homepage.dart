import 'package:clock_app/views/clock_page.dart';

import 'package:clock_app/constants/theme_data.dart';
import 'package:clock_app/data.dart';
import 'package:clock_app/enums.dart';
import 'package:clock_app/models/menu_info.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'alarm_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: menuItems
                  .map((currentmenuInfo) => buildMenuButton(currentmenuInfo))
                  .toList()),
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
                builder: (BuildContext context, value, Widget child) {
              if (value.menuType == MenuType.clock) {
                return ClockPage();
              } else if (value.menuType == MenuType.alarm) {
                return AlarmPage();
              }
            }),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(MenuInfo currentmenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, value, Widget child) {
        return FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(32))),
          padding: const EdgeInsets.symmetric(vertical: 16),
          color: currentmenuInfo.menuType == value.menuType
              ? CustomColors.menuBackgroundColor
              : Colors.transparent,
          onPressed: () {
            var menuInfo = Provider.of<MenuInfo>(context, listen: false);

            menuInfo.updateMenu(currentmenuInfo);
          },
          child: Column(
            children: <Widget>[
              Image.asset(
                currentmenuInfo.imageSource,
                scale: 1.5,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                currentmenuInfo.title,
                style: TextStyle(
                    fontFamily: "avenir", color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        );
      },
    );
  }
}
