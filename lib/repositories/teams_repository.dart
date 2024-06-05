import 'package:deep_flutter/models/team.dart';
import 'package:deep_flutter/models/title_champion.dart';
import 'package:flutter/material.dart';

class TeamsRepository {
  final List<Team> _teams = [];

  get teams => _teams;

  void addTitleChamp(
      {required Team team, required TitleChampion titleChampion}) {
    team.titles.add(titleChampion);
  }

  TeamsRepository() {
    _teams.addAll([
      Team(
        name: 'Flamengo',
        points: 71,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/flamengo.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Internacional',
        points: 69,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/internacional.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Atlético-MG',
        points: 65,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/atletico-mg.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'São Paulo',
        points: 63,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/sao-paulo.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Fluminense',
        points: 61,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/fluminense.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Grêmio',
        points: 59,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/gremio.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Palmeiras',
        points: 58,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/palmeiras.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Santos',
        points: 54,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/santos.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Athletico-PR',
        points: 50,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/atletico-pr.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Corinthians',
        points: 50,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/corinthians.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Bragantino',
        points: 50,
        logo:
            'https://e.imguol.com/futebol/brasoes/40x40/red-bull-bragantino.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Ceará',
        points: 49,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/ceara.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Atlético-GO',
        points: 47,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/atletico-go.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Sport',
        points: 42,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/sport.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Bahia',
        points: 41,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/bahia.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Fortaleza',
        points: 41,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/fortaleza.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Vasco',
        points: 38,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/vasco.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Goiás',
        points: 37,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/goias.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Coritiba',
        points: 31,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/coritiba.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        name: 'Botafogo',
        points: 27,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/botafogo.png',
        color: Colors.red[900],
        titles: [],
      ),
    ]);
  }
}
