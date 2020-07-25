import 'package:JetSamples/risks/transactions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jetkit/jetkit.dart';
import 'package:mobx/mobx.dart';

import 'data_store.dart';

import 'data_store.dart' as s;
import 'data_store_list.dart';

class Cards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return JetPanel(
        child: Column(
      children: [
        JetToolbar(
          color: Colors.lightBlue,
          size: 70,
          children: [
            Logo('Cards', icon: Icons.apps),
            Expanded(child: Container()),
          ],
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Menu(
                    onSelectedChanged: (value, ctx) {
                      DataContext.of<CardType>(ctx).setSelectedIndex(value);
                    },
                    children: DataContext.of<CardType>(context)
                        .items
                        .map((e) => MenuItem(e.name,
                            value: e.value,
                            description: "description...",
                            iconData: Icons.payment))
                        .toList()),
              ),
              Expanded(
                flex: 2,
                child: Observer(builder: (context) {
                  int cardCode = DataContext.of<CardType>(context).selected?.value;
                  return DataContext<TransactionType>(
                      read: () {
                        return TransactionType.getByCardCode(cardCode);
                      },
                      child: Row(
                        children: [
                          Expanded(flex: 1, child: Transactions()),
                          Expanded(
                              flex: 1,
                              child: Observer(builder: (context) {
                                int transactionUid =
                                    DataContext.of<TransactionType>(context).selected.uid;
                                return DataContext<TransactionType>(
                                    read: () {
                                      return TransactionType.getByTransaction(
                                          transactionUid);
                                    },
                                    child: Transactions());
                              }))
                        ],
                      ));
                }),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
