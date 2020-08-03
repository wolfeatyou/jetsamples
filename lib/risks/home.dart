import 'package:JetSamples/risks/data/base/observable_provider.dart';
import 'package:JetSamples/risks/data/named_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jetkit/jetkit.dart';

import 'cards.dart';
import 'data/card_type.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return JetApp(
        child: Provide.valueOf<InstitutionType>(
            value: InstitutionType(555),
            child: CardProvider.allCards(child: Cards())));
  }
}
