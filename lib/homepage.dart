import 'package:clock_app/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);

    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = "";
    if (!timezoneString.startsWith("-")) {
      offsetSign = "+";
    }
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildMenuButton("Clock", "clock_icon.png"),
              buildMenuButton("Alarm", "alarm_icon.png"),
              buildMenuButton("Timer", "timer_icon.png"),
              buildMenuButton("StopWatch", "stopwatch_icon.png"),
            ],
          ),
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 60, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Clock",
                    style: TextStyle(fontFamily: "avenir",color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    formattedTime,
                    style: TextStyle(fontFamily: "avenir",color: Colors.white, fontSize: 64),
                  ),
                  Text(
                    formattedDate,
                    style: TextStyle(fontFamily: "avenir",color: Colors.white, fontSize: 20),
                  ),
                  ClockView(),
                  SizedBox(height: 20),
                  Text(
                    "TimeZone",
                    style: TextStyle(fontFamily: "avenir",color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.language,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "UTC" + offsetSign + timezoneString,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildMenuButton(String title, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: FlatButton(
        onPressed: null,
        child: Column(
          children: <Widget>[
            Image.asset("assets/" + image,scale: 1.5,),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(fontFamily: "avenir",color: Colors.white, fontSize: 14),
            ),
        
            
          ],
        ),
      ),
    );
  }
}
