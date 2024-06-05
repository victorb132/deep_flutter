import 'package:deep_flutter/models/team.dart';

class HomeController {
  late List<Team> tabela;

  HomeController() {
    tabela = [
      Team(
        name: 'Flamengo',
        points: 71,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/flamengo.png',
      ),
      Team(
        name: 'Internacional',
        points: 69,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/internacional.png',
      ),
      Team(
        name: 'Atlético-MG',
        points: 65,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/atletico-mg.png',
      ),
      Team(
        name: 'São Paulo',
        points: 63,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/sao-paulo.png',
      ),
      Team(
        name: 'Fluminense',
        points: 61,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/fluminense.png',
      ),
      Team(
        name: 'Grêmio',
        points: 59,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/gremio.png',
      ),
      Team(
        name: 'Palmeiras',
        points: 58,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/palmeiras.png',
      ),
      Team(
        name: 'Santos',
        points: 54,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/santos.png',
      ),
      Team(
        name: 'Athletico-PR',
        points: 50,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/atletico-pr.png',
      ),
      Team(
        name: 'Corinthians',
        points: 50,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/corinthians.png',
      ),
      Team(
        name: 'Bragantino',
        points: 50,
        logo:
            'https://e.imguol.com/futebol/brasoes/40x40/red-bull-bragantino.png',
      ),
      Team(
        name: 'Ceará',
        points: 49,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/ceara.png',
      ),
      Team(
        name: 'Atlético-GO',
        points: 47,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/atletico-go.png',
      ),
      Team(
        name: 'Sport',
        points: 42,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/sport.png',
      ),
      Team(
        name: 'Bahia',
        points: 41,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/bahia.png',
      ),
      Team(
        name: 'Fortaleza',
        points: 41,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/fortaleza.png',
      ),
      Team(
        name: 'Vasco',
        points: 38,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/vasco.png',
      ),
      Team(
        name: 'Goiás',
        points: 37,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/goias.png',
      ),
      Team(
        name: 'Coritiba',
        points: 31,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/coritiba.png',
      ),
      Team(
        name: 'Botafogo',
        points: 27,
        logo: 'https://e.imguol.com/futebol/brasoes/40x40/botafogo.png',
      ),
    ];
  }
}
