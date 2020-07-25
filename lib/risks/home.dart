import 'package:JetSamples/risks/data/base/data_store.dart';
import 'package:flutter/material.dart';
import 'package:jetkit/jetkit.dart';

import 'cards.dart';
import 'data/card_type.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return JetApp(
        child: ObservableProvider<CardType>(
            get: (context) => () =>  CardType.getAll(),
            child: Cards()));
  }
}
