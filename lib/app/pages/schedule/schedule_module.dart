import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:congressos_sereducacional/app/pages/schedule/lectures_list/lectures_list_bloc.dart';
import 'package:congressos_sereducacional/app/pages/schedule/schedule_bloc.dart';
import 'package:congressos_sereducacional/app/shared/repositories/lecture_repository.dart';
import 'package:flutter/material.dart';
import 'package:congressos_sereducacional/app/pages/schedule/schedule_page.dart';

class ScheduleModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ScheduleBloc()),
        Bloc((i) => LecturesListBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => LectureRepository()),
      ];

  @override
  Widget get view => SchedulePage();

  static Inject get to => Inject<ScheduleModule>.of();
}
