import 'package:JetSamples/risks/data/contract_type.dart';
import 'package:JetSamples/risks/contracts.dart';
import 'package:JetSamples/risks/data/institution_type.dart';
import 'package:JetSamples/risks/transactions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jetkit/jetkit.dart';
import 'data/base/case.dart';
import 'data/base/data_store.dart';
import 'data/card_type.dart';
import 'data/transaction_type.dart';

class Cards extends StatefulWidget {
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  int _rebuilds;
  bool _hideLast = false;
  dynamic _selectedTabValue;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _rebuilds = 0;
    _hideLast = false;
  }

  @override
  Widget build(BuildContext context) {
    return ObservableProvider.provideValueWithBuilderOf<SelectedValueType>(
        get: (context, o) => () => [SelectedValueType(value: 'transactions')].toList(),
        builder: (context) => Panel.withTop(
              top: JetToolbar(
                children: [
                  Logo('Cards', icon: Icons.apps),
                  Expanded(child: Container()),
                  Text('rebuilds: $_rebuilds'),
                  FlatButton(
                    child: Text('rebuild'),
                    onPressed: () {
                      setState(() {
                        _rebuilds = _rebuilds + 1;
                      });
                    },
                  ),
                  FlatButton(
                    child: Text('ok'),
                    onPressed: () {
                      var val = Take.selectedOf<InstitutionType>(context);
                      if (val != null) {
                        if (val.value == 555) {
                          val.setValue.call([333]);
                        } else {
                          val.setValue.call([555]);
                        }
                      }
                    },
                  ),
                  FlatButton(
                    child: Text('ok _ no'),
                    onPressed: () {
                      var val = Take.selectedOf<InstitutionType>(context);
                      if (val != null) {
                        val.setValue.call([val.value]);
                      }
                    },
                  ),
                  FlatButton(
                    child: Text('hide'),
                    onPressed: () {
                      setState(() {
                        _hideLast = !_hideLast;
                      });
                    },
                  )
                ],
                color: Colors.lightBlue,
                size: 70,
              ),
              body: Panel.withLeft(
                left: Menu(
                  children: Take.listOf<CardType>(context)
                      .items
                      .map((e) => MenuItem(e.name,
                          value: e.value,
                          description: "description...",
                          iconData: Icons.payment))
                      .toList(),
                  onSelectedChanged: (value, ctx) {
                    Take.listOf<CardType>(context).setSelectedIndex(value);
                  },
                ),
                body: Panel.withTop(
                    top: Tabs.simpleTabs(
                      direction: Axis.horizontal,
                      tabs: [
                        JetTab(
                            text: "transactions",
                            value: "transactions",
                            selected: true,
                            icon: Icons.transform),
                        JetTab(
                            text: "contracts",
                            value: "contracts",
                            selected: true,
                            icon: Icons.store),
                        JetTab(
                            text: "addresses",
                            value: "addresses",
                            selected: true,
                            icon: Icons.home)
                      ],
                      onSelect: (value, context) {
                        Take.valueOf<SelectedValueType>(context).setValue.call([value]);
                      },
                    ),
                    body:  SwitchChild(
                          value: Take.valueOf<SelectedValueType>(context)?.value,
                          cases: [
                            Case(value: 'transactions', child: _transactionsTab()),
                            Case(
                                value: 'contracts',
                                child: ContractProvider.cardContracts(child: Contracts()))
                          ],
                        ),
                      ),

              ),
            ));
  }

  /*Widget _transactionsTab() {
    return Proxy.providerFor<TransactionType>(
      name: "cardTransactions",
      child: Row(children: [
        Expanded(flex: 1, child: Transactions()),
        if (!_hideLast)
          Proxy.providerFor<TransactionType>(
            name: "subTransactions",
            child: Expanded(
                flex: 1,
                child: Column(children: [
                  Expanded(flex: 1, child: Transactions()),
                  Expanded(flex: 1, child: Transactions())
                ])),
          )
      ]),
    );
  }*/

  Widget _transactionsTab() {
    return TransactionProvider.cardTransactions(
        child: Row(
      children: [
        Expanded(flex: 1, child: Transactions(key: ValueKey(1))),
        if (!_hideLast)
          Expanded(
              flex: 1,
              child: TransactionProvider.subTransactions(
                  child: Column(
                children: [
                  Expanded(flex: 1, child: Transactions(key: ValueKey(2))),
                  Expanded(flex: 1, child: Transactions(key: ValueKey(3)))
                ],
              ))),
      ],
    ));
  }
}
