import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'data_store.dart';
import 'data_store.dart' as s;
part 'data_store_list.g.dart';

class DataStoreList<T> = _DataStoreList<T> with _$DataStoreList;

abstract class _DataStoreList<T> with Store{
  final Serializer<T> serializer;
  final List<Operation> operations;
  final OnReadType<T> onRead;
  final OnUpdateType<T> onUpdate;

  @observable
  int selectedIndex = 0;

  _DataStoreList(this.serializer, this.operations, {this.onRead, this.onUpdate})
      : assert(operations != null),
        assert(serializer != null);

  @computed
  List<T> get items {
    if(onRead!=null){
      return onRead();
    }
    var json;
    Operation read =
    operations.firstWhere((element) => element.type == s.OperationType.read);
    var result = _runOperation(read);
    return result.map((e) => serializer.fromJson(e)).toList();
  }

  @computed
  T get selected{
    var list  = items;
    if(list.length >0){
      return list[selectedIndex];
    }
    return null;
  }

  @action
  void setSelectedIndex(value){
    selectedIndex = value;
  }

  List<Map<String, dynamic>> _runOperation(Operation operation) {
    if (operation.name == 'all_cards') {
      return [
        {"name": "Card name 1", "value" : 0},
        {"name": "Card name 2", "value": 1},
        {"name": "Card name 3", "value": 2},
        {"name": "Card name 4", "value": 3}
      ];
    }

    if (operation.name == 'card_transactions') {
      var cardCode = operation.parameters.firstWhere((element) => element.name == "cardCode" ).value;
      return [
        {"description": "Transaction for card $cardCode", "amount" : 111.0},
        {"description": "Transaction for card $cardCode", "amount" : 222.0},     ];
    }
    return [];
  }


}