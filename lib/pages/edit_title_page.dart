import 'package:deep_flutter/models/title_champion.dart';
import 'package:deep_flutter/repositories/teams_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class EditTitlePage extends StatefulWidget {
  final TitleChampion titleChampion;

  const EditTitlePage({super.key, required this.titleChampion});

  @override
  State<EditTitlePage> createState() => _EditTitlePageState();
}

class _EditTitlePageState extends State<EditTitlePage> {
  final _formKey = GlobalKey<FormState>();
  final _camp = TextEditingController();
  final _year = TextEditingController();

  @override
  void initState() {
    super.initState();
    _year.text = widget.titleChampion.year;
    _camp.text = widget.titleChampion.camp;
  }

  edit() {
    Provider.of<TeamsRepository>(context, listen: false).editTitleChamp(
      titleChampion: widget.titleChampion,
      camp: _camp.text,
      year: _year.text,
    );

    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Editar título'),
          backgroundColor: Colors.grey[900],
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: edit,
            )
          ],
        ),
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: TextFormField(
                  controller: _year,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ano',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: TextFormField(
                  controller: _camp,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Campeonato',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
