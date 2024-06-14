import 'package:deep_flutter/controllers/home_controller.dart';
import 'package:deep_flutter/controllers/theme_controller.dart';
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
    var controller = ThemeController.to;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Brasileirão'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: ListTile(
                  leading: Obx(
                    () => controller.isDarkMode.value
                        ? const Icon(Icons.brightness_7)
                        : const Icon(Icons.brightness_2),
                  ),
                  title: Obx(
                    () => controller.isDarkMode.value
                        ? const Text('Light')
                        : const Text('Dark'),
                  ),
                  onTap: () => controller.changeTheme(),
                ),
              )
            ],
          ),
        ],
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
