import 'package:JetSamples/risks/data/contract_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'data/base/observable_provider.dart';

class Contracts extends StatefulWidget {
  @override
  _ContractsState createState() => _ContractsState();

  Contracts();
}

class _ContractsState extends State<Contracts> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Column(
          children: [
            Visibility(
              visible: Take.listOf<ContractType>(context).reload,
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
              ),
            ),
            Visibility(
              visible: !Take.listOf<ContractType>(context).reload ,
              child: Expanded(
                child: ListView(
                  children: Take.listOf<ContractType>(context)
                      .items
                      .map((e) => _createItem(e, context))
                      .toList(),
                ),
              ),
            ),
          ],
        );
      }
    );
  }

  Widget _createItem(ContractType transaction, BuildContext context) {
    return GestureDetector(
        onTap: () {
          Take.listOf<ContractType>(context).setSelectedIndex(transaction.value);
        },
        child: Padding(padding: EdgeInsets.all(8), child: Text(transaction.name)));
  }
}
