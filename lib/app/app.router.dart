// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:experiment/Ui/ChooseAuthView/ChooseAuthView.dart' as _i2;
import 'package:experiment/Ui/CoachUI/CoachLoginView/CoachLoginView.dart'
    as _i4;
import 'package:experiment/Ui/CoachUI/CoachSignupView/CoachSignupView.dart'
    as _i6;
import 'package:experiment/Ui/PlayerUI/LoginView/PlayerLoginView.dart' as _i3;
import 'package:experiment/Ui/PlayerUI/PlayerHomepage/PlayerHomeView.dart'
    as _i7;
import 'package:experiment/Ui/PlayerUI/PlayerSignupView/PlayerSignupView.dart'
    as _i5;
import 'package:flutter/material.dart' as _i8;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i9;

class Routes {
  static const chooseAuthScreen = '/';

  static const playerLoginview = '/player-loginview';

  static const coachLoginview = '/coach-loginview';

  static const playerSignupView = '/player-signup-view';

  static const coachSignupView = '/coach-signup-view';

  static const playerHomeView = '/player-home-view';

  static const all = <String>{
    chooseAuthScreen,
    playerLoginview,
    coachLoginview,
    playerSignupView,
    coachSignupView,
    playerHomeView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.chooseAuthScreen,
      page: _i2.ChooseAuthScreen,
    ),
    _i1.RouteDef(
      Routes.playerLoginview,
      page: _i3.PlayerLoginview,
    ),
    _i1.RouteDef(
      Routes.coachLoginview,
      page: _i4.CoachLoginview,
    ),
    _i1.RouteDef(
      Routes.playerSignupView,
      page: _i5.PlayerSignupView,
    ),
    _i1.RouteDef(
      Routes.coachSignupView,
      page: _i6.CoachSignupView,
    ),
    _i1.RouteDef(
      Routes.playerHomeView,
      page: _i7.PlayerHomeView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.ChooseAuthScreen: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.ChooseAuthScreen(),
        settings: data,
      );
    },
    _i3.PlayerLoginview: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.PlayerLoginview(),
        settings: data,
      );
    },
    _i4.CoachLoginview: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.CoachLoginview(),
        settings: data,
      );
    },
    _i5.PlayerSignupView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.PlayerSignupView(),
        settings: data,
      );
    },
    _i6.CoachSignupView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.CoachSignupView(),
        settings: data,
      );
    },
    _i7.PlayerHomeView: (data) {
      final args = data.getArgs<PlayerHomeViewArguments>(
        orElse: () => const PlayerHomeViewArguments(),
      );
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.PlayerHomeView(key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class PlayerHomeViewArguments {
  const PlayerHomeViewArguments({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant PlayerHomeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

extension NavigatorStateExtension on _i9.NavigationService {
  Future<dynamic> navigateToChooseAuthScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.chooseAuthScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPlayerLoginview([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.playerLoginview,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCoachLoginview([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.coachLoginview,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPlayerSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.playerSignupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCoachSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.coachSignupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPlayerHomeView({
    _i8.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.playerHomeView,
        arguments: PlayerHomeViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChooseAuthScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.chooseAuthScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPlayerLoginview([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.playerLoginview,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCoachLoginview([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.coachLoginview,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPlayerSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.playerSignupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCoachSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.coachSignupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPlayerHomeView({
    _i8.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.playerHomeView,
        arguments: PlayerHomeViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
