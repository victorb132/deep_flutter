import 'dart:collection';

import 'package:deep_flutter/database/db.dart';
import 'package:deep_flutter/models/team.dart';
import 'package:deep_flutter/models/title_champion.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class TeamsRepository extends ChangeNotifier {
  final List<Team> _teams = [];

  UnmodifiableListView<Team> get teams => UnmodifiableListView(_teams);

  void addTitleChamp({
    required Team team,
    required TitleChampion titleChampion,
  }) async {
    Database db = await DB.get();
    int id = await db.insert('titlesChamp', {
      'championship': titleChampion.camp,
      'year': titleChampion.year,
      'team_id': team.id,
    });
    titleChampion.id = id;
    team.titles.add(titleChampion);
    notifyListeners();
  }

  void editTitleChamp({
    required TitleChampion titleChampion,
    required String camp,
    required String year,
  }) async {
    Database db = await DB.get();
    await db.update(
      'titlesChamp',
      {'championship': camp, 'year': year},
      where: 'id = ?',
      whereArgs: [titleChampion.id],
    );

    titleChampion.camp = camp;
    titleChampion.year = year;
    notifyListeners();
  }

  static setupTeams() {
    return [
      Team(
        id: 0,
        name: 'Flamengo',
        points: 71,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/flamengo.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        id: 1,
        name: 'Internacional',
        points: 69,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/internacional.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        id: 2,
        name: 'Atlético-MG',
        points: 65,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/atletico-mg.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        id: 3,
        name: 'São Paulo',
        points: 63,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/sao-paulo.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        id: 4,
        name: 'Fluminense',
        points: 61,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/fluminense.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        id: 5,
        name: 'Grêmio',
        points: 59,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/gremio.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        id: 6,
        name: 'Palmeiras',
        points: 58,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/palmeiras.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        id: 7,
        name: 'Santos',
        points: 54,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/santos.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        id: 8,
        name: 'Athletico-PR',
        points: 50,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/atletico-pr.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        id: 9,
        name: 'Corinthians',
        points: 50,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/corinthians.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        id: 10,
        name: 'Bragantino',
        points: 50,
        logo:
            'https://e.imguol.com/futebol/brasoes/100x100/red-bull-bragantino.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        id: 11,
        name: 'Ceará',
        points: 49,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/ceara.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        id: 12,
        name: 'Atlético-GO',
        points: 47,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/atletico-go.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        id: 13,
        name: 'Sport',
        points: 42,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/sport.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        id: 14,
        name: 'Bahia',
        points: 41,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/bahia.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        id: 15,
        name: 'Fortaleza',
        points: 41,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/fortaleza.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        id: 16,
        name: 'Vasco',
        points: 38,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/vasco.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        id: 17,
        name: 'Goiás',
        points: 37,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/goias.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        id: 18,
        name: 'Coritiba',
        points: 31,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/coritiba.png',
        color: Colors.red[900],
        titles: [],
      ),
      Team(
        id: 19,
        name: 'Botafogo',
        points: 27,
        logo: 'https://e.imguol.com/futebol/brasoes/100x100/botafogo.png',
        color: Colors.red[900],
        titles: [],
      ),
    ];
  }

  TeamsRepository() {
    initRepository();
  }

  initRepository() async {
    Database db = await DB.get();
    List teams = await db.query('teams');
    for (Team team in teams) {
      _teams.add(
        Team(
          id: team.id,
          name: team.name,
          logo: team.logo,
          points: team.points,
          color: team.color,
          titles: await getTitles(team.id),
        ),
      );
    }
    notifyListeners();
  }

  getTitles(int teamId) async {
    Database db = await DB.get();
    List results = await db.query(
      'titlesChamp',
      where: 'team_id = ?',
      whereArgs: [teamId],
    );

    return results.map((title) {
      return TitleChampion(
        id: title['id'],
        camp: title['championship'],
        year: title['year'],
      );
    }).toList();
  }
}
