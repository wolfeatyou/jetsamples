import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jetkit/jetkit.dart';
import 'package:mobx/mobx.dart';

import 'data_store.dart';
import 'data_store_list.dart';

class Transactions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return  ListView(
          children: DataStoreListWidget.of<TransactionType>(context).items.map((e) => _createItem(e)).toList(),

    );

     //DataStoreList.of<TransactionType>(context).items().map(e) => null))
  }

  Transactions();

  Widget _createItem(TransactionType transaction){
    return Text(transaction.description);
  }
}
