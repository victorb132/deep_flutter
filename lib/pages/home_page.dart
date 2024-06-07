import 'package:deep_flutter/controllers/home_controller.dart';
import 'package:deep_flutter/models/team.dart';
import 'package:deep_flutter/pages/team_page.dart';
import 'package:deep_flutter/repositories/teams_repository.dart';
import 'package:deep_flutter/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brasileirão'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Consumer<TeamsRepository>(
        builder: (context, respositorie, child) {
          return ListView.separated(
            itemCount: respositorie.teams.length,
            itemBuilder: (BuildContext context, int index) {
              final List<Team> team = respositorie.teams;

              return ListTile(
                leading: Logo(
                  image: team[index].logo,
                  width: 40,
                ),
                title: Text(team[index].name),
                subtitle: Text('Títulos: ${team[index].titles.length}'),
                trailing: Text(team[index].points.toString()),
                onTap: () {
                  Get.to(
                    () => TeamPage(
                      key: Key(team[index].name),
                      team: team[index],
                    ),
                  );
                },
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            padding: const EdgeInsets.all(16),
          );
        },
      ),
    );
  }
}
