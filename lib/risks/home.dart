import 'package:JetSamples/risks/data/base/data_store.dart';
import 'package:JetSamples/risks/data/institution_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jetkit/jetkit.dart';

import 'cards.dart';
import 'data/card_type.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return JetApp(
        child: ObservableProvider.provideValueOf<InstitutionType>(
            get: (context, props) => () => [InstitutionType(value: 555)].toList(),
            child: CardProvider.allCards(child: Cards())));
  }
}
