// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_store_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DataStoreList<T> on _DataStoreList<T>, Store {
  Computed<List<T>> _$itemsComputed;

  @override
  List<T> get items => (_$itemsComputed ??=
          Computed<List<T>>(() => super.items, name: '_DataStoreList.items'))
      .value;
  Computed<T> _$selectedComputed;

  @override
  T get selected => (_$selectedComputed ??=
          Computed<T>(() => super.selected, name: '_DataStoreList.selected'))
      .value;

  final _$selectedIndexAtom = Atom(name: '_DataStoreList.selectedIndex');

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  final _$_DataStoreListActionController =
      ActionController(name: '_DataStoreList');

  @override
  void setSelectedIndex(dynamic value) {
    final _$actionInfo = _$_DataStoreListActionController.startAction(
        name: '_DataStoreList.setSelectedIndex');
    try {
      return super.setSelectedIndex(value);
    } finally {
      _$_DataStoreListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex},
items: ${items},
selected: ${selected}
    ''';
  }
}
