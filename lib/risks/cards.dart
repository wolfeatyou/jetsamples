import 'package:JetSamples/risks/transactions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jetkit/jetkit.dart';
import 'data/base/data_store.dart';
import 'data/card_type.dart';
import 'data/transaction_type.dart';

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
                      Pull.store<CardType>(ctx).setSelectedIndex(value);
                    },
                    children: Pull.store<CardType>(context)
                        .items
                        .map((e) => MenuItem(e.name,
                            value: e.value,
                            description: "description...",
                            iconData: Icons.payment))
                        .toList()),
              ),
              Expanded(
                flex: 2,
                child: Push<TransactionType>(
                    read: (context) {
                      int cardCode = Pull.selected<CardType>(context).value;
                      return () => TransactionType.getByCardCode(cardCode);
                    },
                    child: Row(
                      children: [
                        Expanded(flex: 1, child: Transactions()),
                        Expanded(
                            flex: 1,
                            child: Push<TransactionType>(
                                read: (context) {
                                  var transactionId =
                                      Pull.selected<TransactionType>(context)?.uid;
                                  return () =>
                                      TransactionType.getByTransaction(transactionId);
                                },
                                child: Transactions()))
                      ],
                    )),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
