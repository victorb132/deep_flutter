import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:deep_flutter/database/db.dart';
import 'package:deep_flutter/database/db_firestore.dart';
import 'package:deep_flutter/models/team.dart';
import 'package:deep_flutter/models/title_champion.dart';

class TeamsRepository extends ChangeNotifier {
  final List<Team> _teams = [];
  final loading = ValueNotifier(false);

  UnmodifiableListView<Team> get teams => UnmodifiableListView(_teams);

  void addTitleChamp({
    required Team team,
    required TitleChampion titleChampion,
  }) async {
    // Usando o SQLite

    // Database db = await DB.get();
    // int id = await db.insert('titlesChamp', {
    //   'championship': titleChampion.camp,
    //   'year': titleChampion.year,
    //   'team_id': team.id,
    // });
    // titleChampion.id = id;

    // Usando o Firestore

    FirebaseFirestore db = await DBFirestore.get();
    DocumentReference docRef = await db.collection('titlesChamp').add({
      'championship': titleChampion.camp,
      'year': titleChampion.year,
      'team_id': team.id,
    });
    titleChampion.id = docRef.id;

    team.titles.add(titleChampion);
    notifyListeners();
  }

  void editTitleChamp({
    required TitleChampion titleChampion,
    required String camp,
    required String year,
  }) async {
    // Usando o SQLite

    // Database db = await DB.get();
    // await db.update(
    //   'titlesChamp',
    //   {'championship': camp, 'year': year},
    //   where: 'id = ?',
    //   whereArgs: [titleChampion.id],
    // );

    // Usando o Firestore

    FirebaseFirestore db = await DBFirestore.get();
    await db.collection('titlesChamp').doc(titleChampion.id).update({
      'championship': camp,
      'year': year,
    });

    titleChampion.camp = camp;
    titleChampion.year = year;
    notifyListeners();
  }

  static setupTeams() {
    return [
      Team(
        name: 'Flamengo',
        points: 0,
        logo: 'https://logodetimes.com/times/flamengo/logo-flamengo-256.png',
        color: Colors.red[900],
        idAPI: 18,
        titles: [],
      ),
      Team(
        name: 'Internacional',
        points: 0,
        logo:
            'https://logodetimes.com/times/internacional/logo-internacional-256.png',
        color: Colors.red[900],
        idAPI: 44,
        titles: [],
      ),
      Team(
        name: 'Atlético-MG',
        points: 0,
        logo:
            'https://logodetimes.com/times/atletico-mineiro/logo-atletico-mineiro-256.png',
        color: Colors.grey[800],
        idAPI: 30,
        titles: [],
      ),
      Team(
        name: 'São Paulo',
        points: 0,
        logo: 'https://logodetimes.com/times/sao-paulo/logo-sao-paulo-256.png',
        color: Colors.red[900],
        idAPI: 57,
        titles: [],
      ),
      Team(
        name: 'Fluminense',
        points: 0,
        logo:
            'https://logodetimes.com/times/fluminense/logo-fluminense-256.png',
        color: Colors.teal[800],
        idAPI: 26,
        titles: [],
      ),
      Team(
        name: 'Grêmio',
        points: 0,
        logo: 'https://logodetimes.com/times/gremio/logo-gremio-256.png',
        color: Colors.blue[900],
        idAPI: 45,
        titles: [],
      ),
      Team(
        name: 'Palmeiras',
        points: 0,
        logo: 'https://logodetimes.com/times/palmeiras/logo-palmeiras-256.png',
        color: Colors.green[800],
        idAPI: 56,
        titles: [],
      ),
      Team(
        name: 'Santos',
        points: 0,
        logo: 'https://logodetimes.com/times/santos/logo-santos-256.png',
        color: Colors.grey[800],
        idAPI: 63,
        titles: [],
      ),
      Team(
        name: 'Athletico-PR',
        points: 0,
        logo:
            'https://logodetimes.com/times/atletico-paranaense/logo-atletico-paranaense-256.png',
        color: Colors.red[900],
        idAPI: 185,
        titles: [],
      ),
      Team(
        name: 'Corinthians',
        points: 0,
        logo:
            'https://logodetimes.com/times/corinthians/logo-corinthians-256.png',
        color: Colors.grey[800],
        idAPI: 65,
        titles: [],
      ),
      Team(
        name: 'Bragantino',
        points: 0,
        logo:
            'https://logodetimes.com/times/red-bull-bragantino/logo-red-bull-bragantino-256.png',
        color: Colors.grey[800],
        idAPI: 64,
        titles: [],
      ),
      Team(
        name: 'Ceará',
        points: 0,
        logo: 'https://logodetimes.com/times/ceara/logo-ceara-256.png',
        color: Colors.grey[800],
        idAPI: 105,
        titles: [],
      ),
      Team(
        name: 'Atlético-GO',
        points: 0,
        logo:
            'https://logodetimes.com/times/atletico-goianiense/logo-atletico-goianiense-256.png',
        color: Colors.red[900],
        idAPI: 98,
        titles: [],
      ),
      Team(
        name: 'Sport',
        points: 0,
        logo:
            'https://logodetimes.com/times/sport-recife/logo-sport-recife-256.png',
        color: Colors.red[900],
        idAPI: 79,
        titles: [],
      ),
      Team(
        name: 'Bahia',
        points: 0,
        logo: 'https://logodetimes.com/times/bahia/logo-bahia-256.png',
        color: Colors.blue[900],
        idAPI: 68,
        titles: [],
      ),
      Team(
        name: 'Fortaleza',
        points: 0,
        logo: 'https://logodetimes.com/times/fortaleza/logo-fortaleza-256.png',
        color: Colors.red[900],
        idAPI: 131,
        titles: [],
      ),
      Team(
        name: 'Vasco',
        points: 0,
        logo:
            'https://logodetimes.com/times/vasco-da-gama/logo-vasco-da-gama-256.png',
        color: Colors.grey[800],
        idAPI: 23,
        titles: [],
      ),
      Team(
        name: 'Goiás',
        points: 0,
        logo: 'https://logodetimes.com/times/goias/logo-goias-256.png',
        color: Colors.green[900],
        idAPI: 115,
        titles: [],
      ),
      Team(
        name: 'Coritiba',
        points: 0,
        logo: 'https://logodetimes.com/times/coritiba/logo-coritiba-5.png',
        color: Colors.green[900],
        idAPI: 84,
        titles: [],
      ),
      Team(
        name: 'Botafogo',
        points: 0,
        logo: 'https://logodetimes.com/times/botafogo/logo-botafogo-256.png',
        color: Colors.grey[800],
        idAPI: 22,
        titles: [],
      ),
    ];
  }

  TeamsRepository() {
    initRepository();
  }

  showLoading(bool value) {
    loading.value = value;
    notifyListeners();
  }

  updateTableChamp() async {
    showLoading(true);

    // Usando HTTP

    // var response = await http.get(
    //   Uri.parse('https://api.api-futebol.com.br/v1/campeonatos/10/fases/55'),
    //   headers: {
    //     HttpHeaders.authorizationHeader:
    //         'Bearer live_a6bed4b4bc66e2be4614e2670e632f',
    //   },
    // );

    // Usando Dio

    var http = Dio();
    var response = await http.get(
      'https://api.api-futebol.com.br/v1/campeonatos/10/fases/55',
      options: Options(headers: {
        'Authorization': 'Bearer live_a6bed4b4bc66e2be4614e2670e632f',
      }),
    );

    if (response.statusCode == 200) {
      // usando http precisa fazer o decode
      // final json = jsonDecode(response.body);

      final json = response.data;
      final table = json['tabela'];
      final db = await DB.get();

      for (final teamApi in table) {
        final idAPI = teamApi['time']['time_id'];
        final points = teamApi['pontos'];

        await db.update(
          'teams',
          {'points': points},
          where: 'idAPI = ?',
          whereArgs: [idAPI],
        );
        Team team = _teams.firstWhere((team) => team.idAPI == idAPI);
        team.points = points;
        notifyListeners();
        showLoading(false);
      }
    } else {
      throw Exception('Failed to load table');
    }
  }

  initRepository() async {
    Database db = await DB.get();
    List teams = await db.query('teams', orderBy: 'points DESC');

    for (final team in teams) {
      _teams.add(
        Team(
          id: team['id'],
          name: team['name'],
          logo: team['logo'],
          points: team['points'],
          idAPI: team['idAPI'],
          color: Color(int.parse(team['color'])),
          titles: await getTitles(team['id']),
        ),
      );
    }

    updateTableChamp();
    notifyListeners();
  }

  getTitles(int teamId) async {
    // Usando SQLite

    // Database db = await DB.get();
    // List results = await db.query(
    //   'titlesChamp',
    //   where: 'team_id = ?',
    //   whereArgs: [teamId],
    // );

    // return results.map((title) {
    //   return TitleChampion(
    //     id: title['id'],
    //     camp: title['championship'],
    //     year: title['year'],
    //   );
    // }).toList();

    // Usando Firestore

    FirebaseFirestore db = await DBFirestore.get();
    QuerySnapshot snapshot = await db
        .collection('titlesChamp')
        .where('team_id', isEqualTo: teamId)
        .get();
    List<TitleChampion> titles = [];
    for (DocumentSnapshot doc in snapshot.docs) {
      final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      titles.add(
        TitleChampion(
          id: doc.id,
          camp: data['championship'],
          year: data['year'],
        ),
      );
    }
    return titles;
  }
}
