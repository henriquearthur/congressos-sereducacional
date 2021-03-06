import 'package:congressos_sereducacional/app/pages/explore/explore_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:congressos_sereducacional/app/shared/repositories/speaker_repository.dart';
import 'package:flutter/material.dart';
import 'package:congressos_sereducacional/app/pages/explore/explore_page.dart';

class ExploreModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ExploreBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => SpeakerRepository()),
      ];

  @override
  Widget get view => ExplorePage();

  static Inject get to => Inject<ExploreModule>.of();
}
