import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'data_store.dart';

part 'data_store_list.g.dart';

class DataStoreList<T> = _DataStoreList<T> with _$DataStoreList;

abstract class _DataStoreList<T> with Store {
  ReadOperationType<T> onRead;
  final UpdateOperationType<T> onUpdate;
  final CustomOperationType<T> onCustom;
  final BuildContext context;

  @observable
  Map<String, dynamic> props;

  @action
  setProps(Map<String, dynamic> np) {
    props = np;
  }

  @observable
  int selectedIndex = 0;

  @observable
  bool reload = true;

  _DataStoreList({this.onRead, this.onUpdate, this.onCustom, this.props, this.context}) {
    // _items = onRead();

    reaction((_) => props.values.toList().toString(), (msg) {
      print(props.values.toList().toString());
      if (onRead != null) {
        _setReload(true);
        // _items = onRead();
      }
    });
  }

  @observable
  List<T> _items = [];

  @computed
  List<T> get items {
    if (reload) {
      Future.delayed(Duration(seconds: 1), () => _setItems(onRead()));
    }
    return _items;
  }

  @action
  _setItems(items) {
    reload = false;
    _items = items;
  }

  @action
  _setReload(value) {
    reload = value;
  }

  @computed
  T get selected {
    var list = items;
    if (list.length > 0) {
      return list[selectedIndex];
    }
    return null;
  }

  @action
  void setSelectedIndex(value) {
    selectedIndex = value;
  }
}
