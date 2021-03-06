import 'package:congressos_sereducacional/app/pages/explore/explore_module.dart';
import 'package:congressos_sereducacional/app/pages/schedule/schedule_module.dart';
import 'package:flutter/material.dart';

class Destination {
  final String title;
  final IconData icon;
  final WidgetBuilder screen;

  Destination({this.title, this.icon, this.screen});
}

List<Destination> allDestinations = <Destination>[
  Destination(
    title: 'Explorar',
    icon: Icons.home,
    screen: (context) => ExploreModule(),
  ),
  Destination(
    title: 'Programação',
    icon: Icons.calendar_today,
    screen: (context) => ScheduleModule(),
  ),
];
