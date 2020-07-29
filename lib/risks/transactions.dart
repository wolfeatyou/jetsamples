import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jetkit/jetkit.dart';
import 'package:mobx/mobx.dart';

import 'data/base/data_store.dart';
import 'data/base/data_store_list.dart';
import 'data/transaction_type.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();

  Transactions();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return ListView(
          children: Take.listOf<TransactionType>(context)
              .items
              .map((e) => _createItem(e, context))
              .toList(),
        );
      }
    );
  }

  Widget _createItem(TransactionType transaction, BuildContext context) {
    return GestureDetector(
        onTap: () {
          Take.listOf<TransactionType>(context).setSelectedIndex(transaction.uid);
        },
        child: Padding(padding: EdgeInsets.all(8), child: Text(transaction.description)));
  }
}
