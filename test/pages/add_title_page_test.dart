import 'package:flutter_test/flutter_test.dart';

class CampValidator {
  validate({String? camp}) {
    if (camp == null || camp.isEmpty) {
      return 'Campo obrigatório';
    }
  }
}

void main() {
  late CampValidator campValidator;

  setUp(() {
    campValidator = CampValidator();
  });

  group('validação do campo de campeonato', () {
    test(
      'deve retornar uma mensagem de erro caso o campo de campeonato seja nulo',
      () {
        final result = campValidator.validate();
        expect(result, 'Campo obrigatório');
      },
    );

    test(
      'deve retornar uma mensagem de erro caso o campo de campeonato seja vazio',
      () {
        final result = campValidator.validate(camp: '');
        expect(result, 'Campo obrigatório');
      },
    );

    test(
      'deve retornar nulo caso o campo de campeonato esteja preenchido',
      () {
        final result = campValidator.validate(camp: 'Brasileirão');
        expect(result, isNull);
      },
    );
  });
}
