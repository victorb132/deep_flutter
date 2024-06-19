import 'package:deep_flutter/models/team.dart';
import 'package:deep_flutter/models/title_champion.dart';
import 'package:deep_flutter/repositories/teams_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AddTitlePage extends StatefulWidget {
  final Team team;

  const AddTitlePage({super.key, required this.team});

  @override
  State<AddTitlePage> createState() => _AddTitlePageState();
}

class _AddTitlePageState extends State<AddTitlePage> {
  final _formKey = GlobalKey<FormState>();
  final _camp = TextEditingController();
  final _year = TextEditingController();

  save() {
    Provider.of<TeamsRepository>(context, listen: false).addTitleChamp(
      team: widget.team,
      titleChampion: TitleChampion(
        camp: _camp.text,
        year: _year.text,
      ),
    );

    Get.back();

    Get.snackbar(
      'Sucesso',
      'Título salvo com sucesso!',
      backgroundColor: Colors.grey[900],
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar título'),
        backgroundColor: widget.team.color,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: TextFormField(
                key: const Key('year'),
                controller: _year,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ano',
                ),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    TitleChampValidator().validateYear(year: value),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 24,
              ),
              child: TextFormField(
                key: const Key('camp'),
                controller: _camp,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Campeonato',
                ),
                validator: (value) =>
                    TitleChampValidator().validateChamp(camp: value),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.all(24),
                child: ElevatedButton(
                  key: const Key('save'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      save();
                    }
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Salvar',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleChampValidator {
  validateChamp({String? camp}) {
    if (camp == null || camp.isEmpty) {
      return 'Campo obrigatório';
    }
  }

  validateYear({String? year}) {
    if (year == null || year.isEmpty) {
      return 'Campo obrigatório';
    }

    if (year.length < 4 || year.length > 4) {
      return 'O campo precisa ter 4 números';
    }
  }
}
