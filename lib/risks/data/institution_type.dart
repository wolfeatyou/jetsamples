import 'package:mobx/mobx.dart';
part 'institution_type.g.dart';

class InstitutionType {
  InstitutionType({int value}) :_value = Observable(value) {
    setValue = Action(_setValue);
  }

  final _value;
  int get value => _value.value;

  set value(int newValue) => _value.value = newValue;
  Action setValue;

  void _setValue(int value) {
    _value.value = value;
  }
}