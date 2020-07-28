import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'data_store_list.dart';

typedef dynamic ObserveType(dynamic);
typedef ReadOperationType<T> ReadOperationObservable<T>(
    BuildContext context, ObserveType observe);
typedef UpdateOperationType<T> UpdateOperationObservable<T>(BuildContext context);
typedef CustomOperationType<T> CustomOperationObservable<T>(BuildContext context);

typedef List<T> ReadOperationType<T>();
typedef void UpdateOperationType<T>(T value);
typedef void CustomOperationType<T>(T value, String actionName);

class DataContextInherited<T> extends InheritedWidget {
  final DataStoreList<T> data;

  DataContextInherited(
      {Widget child,
      this.data,
      UpdateOperationType<T> update,
      CustomOperationType<T> action,
      ReadOperationType<T> read})
      : super(child: child);

  @override
  bool updateShouldNotify(DataContextInherited oldWidget) {
    return false;
    //return data != oldWidget.data;
  }
}

class ObservableStore<T> extends StatefulWidget {
  final Widget child;
  final ReadOperationObservable get;
  final UpdateOperationObservable set;
  final CustomOperationObservable run;

  ObservableStore({this.child, this.get, this.set, this.run});

  @override
  _ObservableStoreState<T> createState() => _ObservableStoreState<T>();

  static DataStoreList<T> _of<T>(BuildContext context) {
    final DataContextInherited inh =
        context.dependOnInheritedWidgetOfExactType<DataContextInherited<T>>();
    DataStoreList<T> data = inh?.data;
    if (data == null) {
      throw 'Data store not defined in hierarchy';
    }
    return data;
  }
}

class _ObservableStoreState<T> extends State<ObservableStore<T>> {
  DataStoreList<T> store;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context_out) {
    return Observer(builder: (context) {
      Map<String, dynamic> props = {};
      int idx = 0;
      var observe = (dynamic value) {
        props[idx.toString()] = value;
        idx++;
        return value;
      };
      ReadOperationType<T> readOperation =
          this.widget.get != null ? this.widget.get(context, observe) : null;

      if (store == null) {
        store = DataStoreList<T>(onRead: readOperation, props: props, context: context);
      } else {
        store.onRead = readOperation;
        store.setProps(props);
      }
      return DataContextInherited<T>(
        data: store,
        child: widget.child,
      );
    });
  }
}

class ObservableProviders extends StatelessWidget {
  final List<DataStoreList> list;

  ObservableProviders({this.list, child});

  @override
  Widget build(BuildContext context) {
    throw "not implemented";
  }
}

class Take {
  static DataStoreList<T> list<T>(BuildContext context) {
    return ObservableStore._of<T>(context);
  }

  static T selected<T>(BuildContext context) {
    return ObservableStore._of<T>(context).selected;
  }
}
