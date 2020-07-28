
import 'package:flutter/cupertino.dart';

class SwitchValue extends StatelessWidget{
  final dynamic value;
  final List<Case> cases;
  SwitchValue({this.cases, this.value});

  @override
  Widget build(BuildContext context) {
    var c = cases.firstWhere((element) => element.value == value);
    return c.child;
  }

}

class Case{
  final dynamic value;
  Widget child;
  Case({this.child, this.value});
}

class Observation extends StatelessWidget{
  final Widget child;

  Observation({this.child});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Builder(builder: (c){
      return this.child;
    });
  }

}