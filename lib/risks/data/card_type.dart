import 'package:JetSamples/risks/data/base/data_store.dart';

class CardType {
  final String name;
  final dynamic value;

  CardType({this.name, this.value});

  static List<CardType> getAll() {
    return [
      CardType.fromJson({"name": "Card name 1", "value": 0}),
      CardType.fromJson({"name": "Card name 2", "value": 1}),
      CardType.fromJson({"name": "Card name 3", "value": 2}),
      CardType.fromJson({"name": "Card name 4", "value": 3})
    ];
  }

  static CardType fromJson(Map<String, dynamic> json) {
    return CardType(name: json['name'], value: json['value']);
  }

  toJson(CardType card) {
    return {
      'name': card.name,
      'value': card.value,
    };
  }
}