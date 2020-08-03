import 'package:JetSamples/risks/data/named_types.dart';

import 'base/observable_provider.dart';

class CardType {
  final String name;
  final dynamic value;

  CardType({this.name, this.value});

  static List<CardType> getAll(int tt) {
    return [
      CardType.fromJson({"name": "$tt - Card name 1", "value": 0}),
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

class CardProvider {
  static ObservableProvider<CardType> allCards({child}) {
    return ObservableProvider<CardType>(child: child, get: CardProvider.getAllCards);
  }

  static ReadOperationType getAllCards(context, observe) {
    var cId = observe(Take.valueOf<InstitutionType>(context)?.value);
    return () {
      return CardType.getAll(cId);
    };
  }
}
