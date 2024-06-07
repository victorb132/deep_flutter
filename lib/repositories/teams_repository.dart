import 'dart:collection';

import 'package:deep_flutter/models/team.dart';
import 'package:deep_flutter/models/title_champion.dart';
import 'package:flutter/material.dart';

class TeamsRepository extends ChangeNotifier {
  final List<Team> _teams = [];

  UnmodifiableListView<Team> get teams => UnmodifiableListView(_teams);

  void addTitleChamp({
    required Team team,
    required TitleChampion titleChampion,
  }) {
    team.titles.add(titleChampion);
    notifyListeners();
  }

  void editTitleChamp({
    required TitleChampion titleChampion,
    required String camp,
    required String year,
  }) {
    titleChampion.camp = camp;
    titleChampion.year = year;
    notifyListeners();
  }

  TeamsRepository() {
    _teams.addAll([
      Team(
        name: 'Flamengo',
        points: 71,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/flamengo.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Internacional',
        points: 69,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/internacional.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Atlético-MG',
        points: 65,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/atletico-mg.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'São Paulo',
        points: 63,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/sao-paulo.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Fluminense',
        points: 61,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/fluminense.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Grêmio',
        points: 59,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/gremio.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Palmeiras',
        points: 58,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/palmeiras.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Santos',
        points: 54,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/santos.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Athletico-PR',
        points: 50,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/atletico-pr.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Corinthians',
        points: 50,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/corinthians.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Bragantino',
        points: 50,
        logo:
            'https://e.imguol.com/futebol/brasoes/100x100/red-bull-bragantino.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Ceará',
        points: 49,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/ceara.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Atlético-GO',
        points: 47,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/atletico-go.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Sport',
        points: 42,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/sport.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Bahia',
        points: 41,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/bahia.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Fortaleza',
        points: 41,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/fortaleza.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Vasco',
        points: 38,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/vasco.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Goiás',
        points: 37,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/goias.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Coritiba',
        points: 31,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/coritiba.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Botafogo',
        points: 27,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/botafogo.png',
        color: Colors.red[900],
        titles: [],
      ),
    ]);
  }
}
