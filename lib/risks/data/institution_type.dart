import 'package:mobx/mobx.dart';
part 'institution_type.g.dart';

class InstitutionType = _InstitutionType with _$InstitutionType;

abstract class _InstitutionType with Store{

  @observable
  int value;
  _InstitutionType({ this.value});
}