import 'base/observable_value.dart';

class InstitutionType extends ObservableValue<int> {
  InstitutionType(int value) : super(value);
}

class SimpleSelectionType extends ObservableValue<String> {
  SimpleSelectionType(String value) : super(value);
}
