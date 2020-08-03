import 'package:mobx/mobx.dart';


class ObservableValue<T>{
  ObservableValue(T value) :_valueObserver = Observable(value);

  final Observable _valueObserver;
  T get value => _valueObserver.value;

  set value(T newValue) {
    var a = Action( (T newValue) => _valueObserver.value = newValue);
    a.call([newValue]);
  }

}