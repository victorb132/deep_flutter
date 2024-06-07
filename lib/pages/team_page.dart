import 'package:deep_flutter/models/team.dart';
import 'package:deep_flutter/pages/add_title_page.dart';
import 'package:deep_flutter/pages/edit_title_page.dart';
import 'package:deep_flutter/repositories/teams_repository.dart';
import 'package:deep_flutter/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class TeamPage extends StatefulWidget {
  final Team team;

  const TeamPage({super.key, required this.team});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  titlePage() {
    Get.to(() => AddTitlePage(team: widget.team));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.team.name),
            backgroundColor: widget.team.color,
            foregroundColor: Colors.white,
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.stacked_line_chart),
                  text: 'Estatísticas',
                ),
                Tab(
                  icon: Icon(Icons.emoji_events),
                  text: 'Títulos',
                ),
              ],
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: titlePage,
              )
            ],
          ),
          body: TabBarView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Logo(
                      image: widget.team.logo,
                      width: 250,
                    ),
                  ),
                  Text(
                    'Pontos ${widget.team.points}',
                    style: const TextStyle(fontSize: 22),
                  ),
                ],
              ),
              titlesChampionchips(),
            ],
          )),
    );
  }

  Widget titlesChampionchips() {
    final team = Provider.of<TeamsRepository>(context).teams.firstWhere(
          (team) => team.name == widget.team.name,
        );
    final quantityTitles = team.titles.length;

    if (quantityTitles == 0) {
      return const Center(
        child: Text('Nenhum título conquistado'),
      );
    }

    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
            leading: const Icon(Icons.emoji_events),
            title: Text(widget.team.titles[index].camp),
            trailing: Text(widget.team.titles[index].year),
            onTap: () {
              Get.to(
                () => EditTitlePage(
                  titleChampion: widget.team.titles[index],
                ),
                fullscreenDialog: true,
              );
            });
      },
      separatorBuilder: (_, __) => const Divider(),
      itemCount: quantityTitles,
    );
  }
}
