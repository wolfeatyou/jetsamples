import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'data_store_list.dart';

typedef dynamic ObserveType(dynamic);
typedef ReadOperationType<T> ReadOperationObservable<T>(
    BuildContext context, ObserveType observe);
typedef UpdateOperationType<T> UpdateOperationObservable<T>(BuildContext context);
typedef CustomOperationType<T> CustomOperationObservable<T>(BuildContext context);

typedef List<T> ReadOperationType<T>();
typedef void UpdateOperationType<T>(T value);
typedef void CustomOperationType<T>(T value, String actionName);

class ObservableProviderInherited<T> extends InheritedWidget {
  final T data;

  ObservableProviderInherited({Widget child, this.data}) : super(child: child);

  @override
  bool updateShouldNotify(ObservableProviderInherited oldWidget) {
    return false;
  }
}

class ObservableProvider<T> extends StatefulWidget {
  final Widget child;
  final ReadOperationObservable get;
  final UpdateOperationObservable set;
  final CustomOperationObservable run;
  final WidgetBuilder builder;
  final T value;

  ObservableProvider({this.child, this.get, this.set, this.run})
      : builder = null,
        value = null;

  ObservableProvider.value({this.value, this.child})
      : this.run = null,
        this.set = null,
        this.get = null,
        this.builder = null;

  ObservableProvider.builder({this.value, this.builder})
      : this.run = null,
        this.set = null,
        this.get = null,
        this.child = null;

  @override
  _ObservableProviderState<T> createState() {
    return _ObservableProviderState<T>();
  }

  static T _of<T>(BuildContext context) {
    final ObservableProviderInherited inh =
        context.dependOnInheritedWidgetOfExactType<ObservableProviderInherited<T>>();
    T data = inh?.data;
    if (data == null) {
     // throw 'Data $T store not defined in hierarchy';
    }
    return data;
  }

  static ObservableProvider provideValueOf<T>({T value, Widget child}) {
    return ObservableProvider<T>.value(value: value, child: child);
  }

  static ObservableProvider provideValueWithBuilderOf<T>(
      {T value, WidgetBuilder builder}) {
    return ObservableProvider<T>.builder(value: value, builder: builder);
  }

  static ObservableProvider provideListOf<T>(
      {ReadOperationObservable get,
      UpdateOperationObservable set,
      CustomOperationObservable run,
      Widget child}) {
    return ObservableProvider<T>(
      get: get,
      set: set,
      run: run,
      child: child,
    );
  }
}

class _ObservableProviderState<T> extends State<ObservableProvider<T>> {
  DataStoreList<T> store;
  T value;

  @override
  void initState() {
    super.initState();
    if (widget.value != null) {
      value = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (value != null) {
      return ObservableProviderInherited<T>(
        data: value,
        child: Observer(builder: (context) {
          return widget.child ?? widget.builder(context);
        }),
      );
    } else {
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
          return ObservableProviderInherited<DataStoreList<T>>(
            data: store,
            child: Observer(builder: (context) {
              return widget.child ?? widget.builder(context);
            }),
          );
        } else {
          return ObservableProviderInherited<DataStoreList<T>>(
              data: store, child: widget.child ?? widget.builder(context));
        }
      });
    }
  }
}

class Take {
  static DataStoreList<T> listOf<T>(BuildContext context) {
    return ObservableProvider._of<DataStoreList<T>>(context);
  }

  static T valueOf<T>(BuildContext context) {

    var el = ObservableProvider._of<DataStoreList<T>>(context);
    if(el != null){
      return el.selected;
    }
    var data =  ObservableProvider._of<T>(context);
    if (data == null) {
       throw 'Data $T store not defined in hierarchy';
    }
    return data;
  }


}
