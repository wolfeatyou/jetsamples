import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jetgrid/column.dart';
import 'package:jetgrid/data_grid.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              JetText.headerMedium('Last transactions'),
              Container(height: 16),
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
                  visible: !Take.listOf<TransactionType>(context).reload, child: Expanded(
                flex: 1,
                child: JetGridWidget(
                  items: TransactionType.toJsonList(Take.listOf<TransactionType>(context).items),
                  columns: [
                    JetColumn('Description', code: "description", width: 300),
                    JetColumn('Amount '),
                    JetColumn('Date'),
                  ],
                ),
              ))
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
