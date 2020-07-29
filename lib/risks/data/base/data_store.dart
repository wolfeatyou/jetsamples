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

class ObservableProvider<T> extends StatefulWidget {
  final Widget child;
  final ReadOperationObservable get;
  final UpdateOperationObservable set;
  final CustomOperationObservable run;
  final WidgetBuilder builder;

  ObservableProvider({this.child, this.get, this.set, this.run}) : builder = null;

  ObservableProvider.builder({this.get, this.set, this.run, this.builder}) : child = null;

  @override
  _ObservableProviderState<T> createState() => _ObservableProviderState<T>();

  static DataStoreList<T> _of<T>(BuildContext context) {
    final DataContextInherited inh =
        context.dependOnInheritedWidgetOfExactType<DataContextInherited<T>>();
    DataStoreList<T> data = inh?.data;
    if (data == null) {
      throw 'Data $T store not defined in hierarchy';
    }
    return data;
  }

  static ObservableProvider provideValueOf<T>({ReadOperationObservable get,UpdateOperationObservable set, CustomOperationObservable run, Widget child}){
    return ObservableProvider<T>(get:get, set:set, run:run, child:child);
  }
  static ObservableProvider provideValueWithBuilderOf<T>({ReadOperationObservable get,UpdateOperationObservable set, CustomOperationObservable run, WidgetBuilder builder}){
    return ObservableProvider<T>.builder(get:get, set:set, run:run, builder:builder);
  }

  static ObservableProvider provideListOf<T>({ReadOperationObservable get,UpdateOperationObservable set, CustomOperationObservable run, Widget child}){
    return ObservableProvider<T>(get:get, set:set, run:run, child: child,);
  }
}

class _ObservableProviderState<T> extends State<ObservableProvider<T>> {
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
  Widget build(BuildContext context) {
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
      if (widget.builder != null) {
        return DataContextInherited<T>(
          data: store,
          child: Observer(builder: (context) {
            return widget.child ?? widget.builder(context);
          }),
        );
      } else {
        return DataContextInherited<T>(
            data: store, child: widget.child ?? widget.builder(context));
      }
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
  static DataStoreList<T> listOf<T>(BuildContext context) {
    return ObservableProvider._of<T>(context);
  }

  static T selectedOf<T>(BuildContext context) {
    return ObservableProvider._of<T>(context).selected;
  }

  static T valueOf<T>(BuildContext context) {
    return ObservableProvider._of<T>(context).selected;
  }
}
