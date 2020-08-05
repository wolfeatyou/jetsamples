import 'package:JetSamples/risks/data/contract_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jetgrid/column.dart';
import 'package:jetgrid/data_grid.dart';
import 'package:jetkit/jetkit.dart';
import 'data/base/observable_provider.dart';

class Contracts extends StatefulWidget {
  @override
  _ContractsState createState() => _ContractsState();

  Contracts();
}

class _ContractsState extends State<Contracts> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          JetText.headerMedium('Card contracts'),
          Container(
              height: 16),
          Visibility(
            visible: Take.listOf<ContractType>(context).reload,
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: ListView(
                  children:
                    List.generate(50, (index) =>  Container(
                      height: 12,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                      ),
                    ))
                ),
              ),
            ),
          ),
          Visibility(
              visible: !Take.listOf<ContractType>(context).reload, child: Expanded(
            flex: 1,
                child: JetGridWidget(
                  items: ContractType.toJsonList(Take.listOf<ContractType>(context).items),
            columns: [
                JetColumn('Type of Actions', code: "name"),
                JetColumn('Last Purchased ',width: 200),
                JetColumn('Value One'),
                JetColumn('Value Two', width: 250),
                JetColumn('From'),
                JetColumn('Quantity')
            ],
          ),
              ))
        ],
      );
    });
  }

  Widget _createItem(ContractType transaction, BuildContext context) {
    return GestureDetector(
        onTap: () {
          Take.listOf<ContractType>(context).setSelectedIndex(transaction.value);
        },
        child: Padding(padding: EdgeInsets.all(8), child: Text(transaction.name)));
  }
}
