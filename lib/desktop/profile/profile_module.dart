import 'package:JetSamples/desktop/profile/settings.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'account.dart';


class ProfileModule extends ChildModule {

  // here will be any class you want to inject into your project (eg bloc, dependency)
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
    Router("/account", child: (_, args) => Account(), transition: TransitionType.leftToRight),
    Router("/settings", child: (_, args) => Settings(), transition: TransitionType.leftToRight)
  ];

  static Inject get to => Inject<ProfileModule>.of();
}