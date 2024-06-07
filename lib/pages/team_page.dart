import 'package:deep_flutter/models/team.dart';
import 'package:deep_flutter/models/title_champion.dart';
import 'package:deep_flutter/pages/add_title_page.dart';
import 'package:flutter/material.dart';

class TeamPage extends StatefulWidget {
  final Team team;

  const TeamPage({super.key, required this.team});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  titlePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) {
        return AddTitlePage(
          team: widget.team,
        );
      }),
    );
  }

  addTitleChamp(TitleChampion titleChampion) {
    setState(() {
      widget.team.titles.add(titleChampion);
    });

    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Título adicionado com sucesso'),
        duration: Duration(seconds: 2),
      ),
    );
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
                    child: Image.network(
                      widget.team.logo.replaceAll("40x40", "100x100"),
                    ),
                  ),
                  Text(
                    'Pontos ${widget.team.points}',
                    style: const TextStyle(fontSize: 22),
                  ),
                ],
              ),
              titles(),
            ],
          )),
    );
  }

  Widget titles() {
    final quantity = widget.team.titles.length;

    if (quantity == 0) {
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
        );
      },
      separatorBuilder: (_, __) => const Divider(),
      itemCount: quantity,
    );
  }
}
