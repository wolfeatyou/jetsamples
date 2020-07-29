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
    return ObservableStore<SelectedValueType>(
        get: (context, o) => () => [SelectedValueType(value: 'transactions')].toList(),
        child: Observer(builder: (context) {
          return Panel.withTop(
            top: JetToolbar(
              color: Colors.lightBlue,
              size: 70,
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
                    var val = Take.selected<InstitutionType>(context);
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
                    var val = Take.selected<InstitutionType>(context);
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
            ),
            body: Panel.withLeft(
              left: Menu(
                  onSelectedChanged: (value, ctx) {
                    Take.list<CardType>(context).setSelectedIndex(value);
                  },
                  children: Take.list<CardType>(context)
                      .items
                      .map((e) => MenuItem(e.name,
                          value: e.value,
                          description: "description...",
                          iconData: Icons.payment))
                      .toList()),
              body: Panel.withTop(
                  top: JetTabs.common(
                      onSelect: (value, context) {
                        Take.selected<SelectedValueType>(context).setValue.call([value]);
                      },
                      scheme:
                          JetTabsColorScheme.defaultScheme(JetTheme.of(context).palette)
                              .scheme,
                      direction: Axis.horizontal,
                      items: [
                        JetTabEntry(
                            text: "transactions",
                            value: "transactions",
                            selected: true,
                            icon: Icons.transform),
                        JetTabEntry(
                            text: "contracts",
                            value: "contracts",
                            selected: true,
                            icon: Icons.store),
                        JetTabEntry(
                            text: "addresses",
                            value: "addresses",
                            selected: true,
                            icon: Icons.home)
                      ]),
                  body: SwitchValue(
                    value: Take.selected<SelectedValueType>(context).value,
                    cases: [
                      Case(value: 'transactions', child: _transactionsTab()),
                      Case(
                          value: 'contracts',
                          child: ContractTypeStore.cardContracts(child: Contracts()))
                    ],
                  )),
            ),
          );
        }));
  }

  Widget _transactionsTab() {
    return TransactionTypeStore.cardTransactions(
        child: Row(
      children: [
        Expanded(flex: 1, child: Transactions()),
        if (!_hideLast)
          Expanded(
              flex: 1,
              child: TransactionTypeStore.subTransactions(
                  child: Column(
                children: [
                  Expanded(flex: 1, child: Transactions()),
                  Expanded(flex: 1, child: Transactions())
                ],
              ))),
      ],
    ));
  }
}
