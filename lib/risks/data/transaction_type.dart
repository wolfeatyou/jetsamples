
import 'package:flutter/cupertino.dart';

import 'base/data_store.dart';
import 'base/data_store_list.dart';


class TransactionType {
  final int uid;
  final String description;
  final double amount;

  TransactionType({this.description, this.amount, this.uid});

  static List<TransactionType> getByCardCode(int cardCode) {
    return [
      TransactionType.fromJson(
          {"description": "Transaction for card $cardCode", "amount": 111.0, "uid": 0}),
      TransactionType.fromJson(
          {"description": "Transaction for card $cardCode", "amount": 222.0, "uid": 1}),
    ];
  }

  static List<TransactionType> getByTransaction(int uid) {
    return [
      TransactionType.fromJson(
          {"description": "Sub Transaction for $uid", "amount": 111.0, "uid": 0}),
      TransactionType.fromJson(
          {"description": "Sub Transaction for $uid", "amount": 222.0, "uid": 1}),
    ];
  }

  static TransactionType fromJson(Map<String, dynamic> json) {
    return TransactionType(
        description: json['description'], amount: json['amount'],  uid: json['uid']);
  }

  toJson(TransactionType card) {
    return {
      'description': card.description,
      'amount': card.amount,
      'uid': card.uid,
    };
  }


}
