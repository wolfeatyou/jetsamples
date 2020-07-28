
import 'package:JetSamples/risks/data/institution_type.dart';

class ContractType {
  final String name;
  final dynamic value;

  ContractType({this.name, this.value});

  static List<ContractType> getByCard(int card) {
    return [
      ContractType.fromJson({"name": "Contract name 1 - $card", "value": 0}),
      ContractType.fromJson({"name": "Contract  name 2 - $card", "value": 1}),
      ContractType.fromJson({"name": "Contract  name 3 - $card", "value": 2}),
      ContractType.fromJson({"name": "Contract  name 4 - $card", "value": 3})
    ];
  }

  static ContractType fromJson(Map<String, dynamic> json) {
    return ContractType(name: json['name'], value: json['value']);
  }

  toJson(ContractType card) {
    return {
      'name': card.name,
      'value': card.value,
    };
  }
}