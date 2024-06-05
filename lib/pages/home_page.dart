import 'package:deep_flutter/controllers/home_controller.dart';
import 'package:deep_flutter/models/team.dart';
import 'package:deep_flutter/pages/team_page.dart';
import 'package:flutter/material.dart';

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
        title: const Text('Deep Flutter'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        itemCount: controller.table.length,
        itemBuilder: (BuildContext context, int index) {
          final List<Team> table = controller.table;

          return ListTile(
            leading: Image.network(table[index].logo),
            title: Text(table[index].name),
            trailing: Text(table[index].points.toString()),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TeamPage(
                    key: Key(table[index].name),
                    team: table[index],
                  ),
                ),
              );
            },
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        padding: const EdgeInsets.all(16),
      ),
    );
  }
}
