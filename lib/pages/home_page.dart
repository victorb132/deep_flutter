import 'package:deep_flutter/controllers/home_controller.dart';
import 'package:deep_flutter/controllers/theme_controller.dart';
import 'package:deep_flutter/models/team.dart';
import 'package:deep_flutter/pages/team_page.dart';
import 'package:deep_flutter/repositories/teams_repository.dart';
import 'package:deep_flutter/services/auth_service.dart';
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

    showChooseTeam() {
      Get.back();

      final teams = Provider.of<TeamsRepository>(context, listen: false).teams;
      List<SimpleDialogOption> items = [];

      for (var team in teams) {
        items.add(
          SimpleDialogOption(
            child: Row(
              children: [
                Logo(
                  image: team.logo,
                  width: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(team.name),
                ),
              ],
            ),
            onPressed: () {
              Get.find<AuthService>().setTeam(team);
              Get.back();
            },
          ),
        );
      }
      final SimpleDialog dialog = SimpleDialog(
        title: const Text('Escolha sua torcida'),
        insetPadding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 6,
        ),
        children: items,
      );

      showDialog(
        context: context,
        builder: (_) => dialog,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Consumer<TeamsRepository>(
          builder: (context, repository, child) {
            return repository.loading.value
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text('Atualizando...  ')
                    ],
                  )
                : const Text('Tabela Brasileirão');
          },
        ),
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
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: const Icon(Icons.sports_soccer),
                  title: const Text('Escolher Torcida'),
                  onTap: () => showChooseTeam(),
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Sair'),
                  onTap: () {
                    Navigator.pop(context);
                    AuthService.to.logout();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: Consumer<TeamsRepository>(
        builder: (context, respositorie, child) {
          return RefreshIndicator(
            child: ListView.separated(
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
            ),
            onRefresh: () => respositorie.updateTableChamp(),
          );
        },
      ),
    );
  }
}
