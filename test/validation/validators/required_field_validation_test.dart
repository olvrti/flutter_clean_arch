import 'package:test/test.dart';
import 'package:meta/meta.dart';

abstract class FieldValidation {
  String get field;
  String validate(String value);
}

class RequiredFieldValidation implements FieldValidation {
  final String field;

  RequiredFieldValidation({@required this.field});

  String validate(String value) {
    return value?.isNotEmpty == true ? null : 'Campo Obrigatório.';
  }
}

void main() {
  RequiredFieldValidation sut;

  setUp(() {
    sut = RequiredFieldValidation(field: 'any_field');
  });

  test('Should return null if value is not empty', () {
    expect(sut.validate('any_value'), null);
  });

  test('Should return error if value is empty', () {
    expect(sut.validate(''), 'Campo Obrigatório.');
  });

  test('Should return error if value is null', () {
    expect(sut.validate(null), 'Campo Obrigatório.');
  });
}
