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
          children: DataContext.of<TransactionType>(context).items.map((e) => _createItem(e, context)).toList(),

    );

     //DataStoreList.of<TransactionType>(context).items().map(e) => null))
  }

  Transactions();

  Widget _createItem(TransactionType transaction, BuildContext context){
    return GestureDetector(
        onTap: (){
          DataContext.of<TransactionType>(context).setSelectedIndex(transaction.uid);
        },
        child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(transaction.description)));
  }
}
