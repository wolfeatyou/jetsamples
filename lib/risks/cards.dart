import 'package:JetSamples/risks/data/contract_type.dart';
import 'package:JetSamples/risks/contracts.dart';
import 'package:JetSamples/risks/data/named_types.dart';
import 'package:JetSamples/risks/transactions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jetkit/jetkit.dart';
import 'data/base/case.dart';
import 'data/base/observable_provider.dart';
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
    return Provide.valueBuilderOf<SimpleSelectionType>(
        value: SimpleSelectionType('transactions'),
        builder: (context) => Panel.withTop(
              top: Container(
                decoration: BoxDecoration(
                     border: Border(bottom: BorderSide(
                        width: 2, color:  JetTheme.of(context).palette.gray30

                    ))
                ),
                child: Bar(
                  children: [
                    Logo('Risk monitoring', icon: Icons.apps),
                    Expanded(child: Container(
                    )),
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
                        var val = Take.valueOf<InstitutionType>(context);
                        if (val != null) {
                          if (val.value == 555) {
                            val.value = 333;
                          } else {
                            val.value = 555;
                          }
                        }
                      },
                    ),
                    FlatButton(
                      child: Text('ok _ no'),
                      onPressed: () {
                        var val = Take.valueOf<InstitutionType>(context);
                        if (val != null) {
                          val.value = val.value;
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
                  color: JetTheme.of(context).palette.white,
                  size: 64,
                ),
              ),
              body: Panel.withLeft(
                left: Panel.withTop(
                  top:Container(
                    height: 49,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(
                        width: 1,
                        color: JetTheme.of(context).palette.gray20
                      ))
                    ),
                  ),
                  body: Paddings.top(
                    color: JetTheme.of(context).palette.gray20,
                    child: Menu(
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
                  )
                ),
                body: Panel.withTop(
                  //padding: EdgeInsetsDirectional.only(start:50),
                  top: Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(
                            width: 1, color:  JetTheme.of(context).palette.gray20

                        ))
                    ),
                    child: Paddings.left(
                      color: JetTheme.of(context).palette.gray30,
                      left: 70,
                      child: Tabs.simpleTabs(
                        direction: Axis.horizontal,
                        tabs: [
                          JetTab(
                              text: "Transactions",
                              value: "transactions",
                              selected: true,
                              icon: Icons.transform),
                          JetTab(
                              text: "Contracts",
                              value: "contracts",
                              selected: true,
                              icon: Icons.store),
                          JetTab(
                              text: "Addresses",
                              value: "addresses",
                              selected: true,
                              icon: Icons.home)
                        ],
                        onSelect: (value, context) {
                          Take.valueOf<SimpleSelectionType>(context).value = value;
                        },
                      ),
                    ),
                  ),
                  body: Paddings.content(
                    left: 70,
                    child: SwitchChild(
                      value: Take.valueOf<SimpleSelectionType>(context)?.value,
                      cases: [
                        Case(value: 'transactions', child: _transactionsTab()),
                        Case(
                            value: 'contracts',
                            child: ContractProvider.cardContracts(child: Contracts()))
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }

  Widget _transactionsTab() {
    return Provide.listOf<TransactionType>(
        get: TransactionProvider.getByCard,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible( child: Container(
                  height: 300,
                  child: Transactions(key: ValueKey(1)))),
              Panel.splitHorizontal(
                left:  Container(
                    height: 300,
                    child: Transactions(key: ValueKey(2))),
                body:  Container(
                    height: 300,
                    child: Transactions(key: ValueKey(2))),
              )

             /* if (false)
                Flexible(
                    flex: 2,
                    child: TransactionProvider.subTransactions(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(flex: 1, child: IntrinsicHeight(child: Transactions(key: ValueKey(2)))),
                        Flexible(flex: 1, child: IntrinsicHeight(child: Transactions(key: ValueKey(3))))
                      ],
                    ))),*/
            ],
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
}
