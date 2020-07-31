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

  final _$propsAtom = Atom(name: '_DataStoreList.props');

  @override
  Map<String, dynamic> get props {
    _$propsAtom.reportRead();
    return super.props;
  }

  @override
  set props(Map<String, dynamic> value) {
    _$propsAtom.reportWrite(value, super.props, () {
      super.props = value;
    });
  }

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

  final _$reloadAtom = Atom(name: '_DataStoreList.reload');

  @override
  bool get reload {
    _$reloadAtom.reportRead();
    return super.reload;
  }

  @override
  set reload(bool value) {
    _$reloadAtom.reportWrite(value, super.reload, () {
      super.reload = value;
    });
  }

  final _$_itemsAtom = Atom(name: '_DataStoreList._items');

  @override
  List<T> get _items {
    _$_itemsAtom.reportRead();
    return super._items;
  }

  @override
  set _items(List<T> value) {
    _$_itemsAtom.reportWrite(value, super._items, () {
      super._items = value;
    });
  }

  final _$_DataStoreListActionController =
      ActionController(name: '_DataStoreList');

  @override
  dynamic setProps(Map<String, dynamic> np) {
    final _$actionInfo = _$_DataStoreListActionController.startAction(
        name: '_DataStoreList.setProps');
    try {
      return super.setProps(np);
    } finally {
      _$_DataStoreListActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setItems(dynamic items) {
    final _$actionInfo = _$_DataStoreListActionController.startAction(
        name: '_DataStoreList._setItems');
    try {
      return super._setItems(items);
    } finally {
      _$_DataStoreListActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setReload(dynamic value) {
    final _$actionInfo = _$_DataStoreListActionController.startAction(
        name: '_DataStoreList._setReload');
    try {
      return super._setReload(value);
    } finally {
      _$_DataStoreListActionController.endAction(_$actionInfo);
    }
  }

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
props: ${props},
selectedIndex: ${selectedIndex},
reload: ${reload},
items: ${items},
selected: ${selected}
    ''';
  }
}
