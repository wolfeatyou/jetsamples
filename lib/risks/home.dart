import 'package:JetSamples/risks/data_store.dart';
import 'package:flutter/material.dart';
import 'package:jetkit/jetkit.dart';

import 'cards.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return JetApp(
        child: DataStoreListWidget<CardType>(
            serializer: CardTypeSerializer(),
            operations: [
              Operation(OperationType.read, 'all_cards',
                  parameters: [Parameter('institution', 23)])
            ],
            child: Cards()));
  }
}