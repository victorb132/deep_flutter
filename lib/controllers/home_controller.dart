import 'package:deep_flutter/models/team.dart';
import 'package:deep_flutter/repositories/teams_repository.dart';

class HomeController {
  late TeamsRepository teamsRepository;

  List<Team> get table => teamsRepository.teams;

  HomeController() {
    teamsRepository = TeamsRepository();
  }
}
