import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jetkit/jetkit.dart';
import 'package:mobx/mobx.dart';

import 'data/base/observable_provider.dart';
import 'data/base/data_store_list.dart';
import 'data/transaction_type.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();

  Transactions({Key key}) : super(key: key);
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return Observer(
        key: ValueKey(widget.key),
        builder: (context) {
          if (Take.listOf<TransactionType>(context)?.reload == true) {
            // return Text('loading...');
          }
          return Column(
            children: [
              Visibility(
                  visible: Take.listOf<TransactionType>(context)?.reload == true,
                  child: Expanded(
                    child: ListView(
                      children: [
                        Container(
                          height:12,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          height:12,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          height:12,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  )),
              Visibility(
                visible: Take.listOf<TransactionType>(context)?.reload == false,
                child: Expanded(
                  child: ListView(
                    children: Take.listOf<TransactionType>(context)
                        .items
                        .map((e) => _createItem(e, context))
                        .toList(),
                  ),
                ),
              ),
            ],
          );
        });
  }

  Widget _createItem(TransactionType transaction, BuildContext context) {
    return GestureDetector(
        onTap: () {
          Take.listOf<TransactionType>(context).setSelectedIndex(transaction.uid);
        },
        child: Padding(padding: EdgeInsets.all(8), child: Text(transaction.description)));
  }
}
