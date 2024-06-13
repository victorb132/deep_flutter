import 'package:deep_flutter/models/team.dart';
import 'package:deep_flutter/pages/add_title_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

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

void main() {
  late TitleChampValidator titleChampValidator;

  setUp(() {
    titleChampValidator = TitleChampValidator();
  });

  group('validação do campo de campeonato', () {
    test(
      'deve retornar uma mensagem de erro caso o campo de campeonato seja nulo',
      () {
        final result = titleChampValidator.validateChamp();
        expect(result, 'Campo obrigatório');
      },
    );

    test(
      'deve retornar uma mensagem de erro caso o campo de campeonato seja vazio',
      () {
        final result = titleChampValidator.validateChamp(camp: '');
        expect(result, 'Campo obrigatório');
      },
    );

    test(
      'deve retornar nulo caso o campo de campeonato esteja preenchido',
      () {
        final result = titleChampValidator.validateChamp(camp: 'Brasileirão');
        expect(result, isNull);
      },
    );
  });

  group('validação do campo de ano', () {
    test(
      'deve retornar uma mensagem de erro caso o campo de ano seja nulo',
      () {
        final result = titleChampValidator.validateYear();
        expect(result, 'Campo obrigatório');
      },
    );

    test(
      'deve retornar uma mensagem de erro caso o campo de ano seja vazio',
      () {
        final result = titleChampValidator.validateYear(year: '');
        expect(result, 'Campo obrigatório');
      },
    );

    test(
      'deve retornar uma mensagem de erro caso o campo de ano tenha menos do que 4 caracteres',
      () {
        final result = titleChampValidator.validateYear(year: '202');
        expect(result, 'O campo precisa ter 4 números');
      },
    );

    test(
      'deve retornar uma mensagem de erro caso o campo de ano tenha mais do que 4 caracteres',
      () {
        final result = titleChampValidator.validateYear(year: '20222');
        expect(result, 'O campo precisa ter 4 números');
      },
    );

    test(
      'deve retornar nulo caso o campo de ano tenha 4 caracteres',
      () {
        final result = titleChampValidator.validateYear(year: '2022');
        expect(result, isNull);
      },
    );
  });

  group(
    'Testes do campo de ano',
    () {
      late Team team;

      setUp(() {
        team = Team(
          name: 'Flamengo',
          logo: 'flamengo.png',
          points: 0,
          titles: [],
        );
      });

      testWidgets(
        'deve confirmar que o campo de ano aparece na tela corretamente',
        (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: AddTitlePage(team: team),
            ),
          );

          final yearKey = find.byKey(const Key('year'));

          expect(yearKey, findsOneWidget);
        },
      );

      testWidgets(
        'deve confirmar que o campo de campeonato aparece na tela corretamente',
        (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: AddTitlePage(team: team),
            ),
          );

          final campKey = find.byKey(const Key('camp'));

          expect(campKey, findsOneWidget);
        },
      );

      testWidgets(
        'deve confirmar que o botão de salvar aparece na tela corretamente',
        (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: AddTitlePage(team: team),
            ),
          );

          final saveButton = find.byKey(const Key('save'));

          expect(saveButton, findsOneWidget);
        },
      );
    },
  );
}
