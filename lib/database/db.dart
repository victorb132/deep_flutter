import 'package:deep_flutter/models/team.dart';
import 'package:deep_flutter/repositories/teams_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  DB._();

  static final DB instance = DB._();
  static Database? _database;

  Future<Database> get database async {
    return _database ??= await initDatabase();
  }

  static get() async {
    return await DB.instance.database;
  }

  initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'dados.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(teams);
        await db.execute(titlesChamp);
        await setupTeams(db);
      },
    );
  }

  setupTeams(Database db) {
    for (Team team in TeamsRepository.setupTeams()) {
      db.insert('teams', {
        'name': team.name,
        'logo': team.logo,
        'points': team.points,
        'color':
            team.color.toString().replaceAll('Color(', '').replaceAll(')', ''),
      });
    }
  }

  String get teams => '''
    CREATE TABLE teams(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      points INTEGER,
      logo TEXT,
      color TEXT
    )
  ''';

  String get titlesChamp => '''
    CREATE TABLE titlesChamp(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      championship TEXT,
      year TEXT,
      team_id INTEGER,
      FOREIGN KEY(team_id) REFERENCES teams(id) ON DELETE CASCADE
    )
  ''';
}
