import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data_store_list.dart';

class Serializer<T> {
  T fromJson(Map<String, dynamic> json) {
    throw 'not implemented';
  }
}

class CardTypeSerializer implements Serializer<CardType> {
  @override
  CardType fromJson(Map<String, dynamic> json) {
    return CardType(name: json['name'], value: json['value']);
  }

  toJson(CardType card) {
    return {
      'name': card.name,
      'value': card.value,
    };
  }
}

class CardType {
  final String name;
  final dynamic value;

  CardType({this.name, this.value});

  static List<CardType> getAll() {
    return [
      CardTypeSerializer().fromJson({"name": "Card name 1", "value": 0}),
      CardTypeSerializer().fromJson({"name": "Card name 2", "value": 1}),
      CardTypeSerializer().fromJson({"name": "Card name 3", "value": 2}),
      CardTypeSerializer().fromJson({"name": "Card name 4", "value": 3})
    ];
  }
}

class TransactionTypeSerializer implements Serializer<TransactionType> {
  @override
  TransactionType fromJson(Map<String, dynamic> json) {
    return TransactionType(
        description: json['description'], amount: json['amount']);
  }

  toJson(TransactionType card) {
    return {
      'description': card.description,
      'amount': card.amount,
    };
  }
}

class TransactionType {
  final String description;
  final double amount;

  TransactionType({this.description, this.amount});

  static List<TransactionType> getByCardCode(int cardCode) {
    return [
      TransactionTypeSerializer().fromJson(
          {"description": "Transaction for card $cardCode", "amount": 111.0}),
      TransactionTypeSerializer().fromJson(
          {"description": "Transaction for card $cardCode", "amount": 222.0}),
    ];
  }
}

typedef List<T> OnReadType<T>();
typedef void OnUpdateType<T>(T value);
typedef void OnActionType<T>(T value, String actionName);

class DataContext<T> extends InheritedWidget {
  final DataStoreList<T> data;

  DataContext(
      {Serializer<T> serializer,
      List<Operation> operations,
      Widget child,
      OnUpdateType<T> update,
      OnActionType<T> action,
      OnReadType<T> read})
      : data = DataStoreList<T>(serializer:serializer, operations:operations,
            onRead: read, onUpdate: update),
        super(child: child);

  @override
  bool updateShouldNotify(DataContext oldWidget) {
    return data != oldWidget.data;
  }

  static DataStoreList<T> of<T>(BuildContext context) {
    final DataContext inh =
        context.dependOnInheritedWidgetOfExactType<DataContext<T>>();
    DataStoreList<T> data = inh?.data;
    if (data == null) {
      throw 'Data store not defined in hierarchy';
    }
    return data;
  }
}

enum OperationType { read, update, action }

class Operation {
  String name;
  OperationType type;
  List<Parameter> parameters;

  Operation(this.type, this.name, {this.parameters});
}

class Parameter {
  String name;
  dynamic value;

  Parameter(this.name, this.value);
}
