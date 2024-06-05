import 'package:deep_flutter/models/title_champion.dart';
import 'package:flutter/material.dart';

class Team {
  String name;
  String logo;
  int points;
  Color? color;
  List<TitleChampion> titles;

  Team({
    required this.name,
    required this.logo,
    required this.points,
    this.color,
    required this.titles,
  });
}
