import 'package:flutter/material.dart';

class AlarmInfo {
  DateTime alaramDateTime;
  String description;
  bool isActive;
  List<Color> gradientColors;

  AlarmInfo(this.alaramDateTime, {this.description,this.gradientColors});
}
