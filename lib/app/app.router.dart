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
import 'package:experiment/Ui/PlayerHomepage/PlayerHomeView.dart' as _i11;
import 'package:experiment/Ui/PlayerUI/DiscoverPageView/DiscoverPageView.dart'
    as _i10;
import 'package:experiment/Ui/PlayerUI/LoginView/PlayerLoginView.dart' as _i3;
import 'package:experiment/Ui/PlayerUI/PlayerHomepage/PlayerHomeView.dart'
    as _i7;
import 'package:experiment/Ui/PlayerUI/PlayerSignupView/PlayerSignupView.dart'
    as _i5;
import 'package:experiment/Ui/PlayerUI/ReportPageView/ReportPageView.dart'
    as _i9;
import 'package:experiment/Ui/PlayerUI/SettingsPageView/SettingsPageView.dart'
    as _i8;
import 'package:flutter/material.dart' as _i12;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i13;

class Routes {
  static const chooseAuthScreen = '/';

  static const playerLoginview = '/player-loginview';

  static const coachLoginview = '/coach-loginview';

  static const playerSignupView = '/player-signup-view';

  static const coachSignupView = '/coach-signup-view';

  static const playerHomeView = '/player-home-view';

  static const settingspageview = '/Settingspageview';

  static const reportpageview = '/Reportpageview';

  static const discoverpageview = '/Discoverpageview';

  static const trainingPageView = '/training-page-view';

  static const all = <String>{
    chooseAuthScreen,
    playerLoginview,
    coachLoginview,
    playerSignupView,
    coachSignupView,
    playerHomeView,
    settingspageview,
    reportpageview,
    discoverpageview,
    trainingPageView,
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
    _i1.RouteDef(
      Routes.settingspageview,
      page: _i8.Settingspageview,
    ),
    _i1.RouteDef(
      Routes.reportpageview,
      page: _i9.Reportpageview,
    ),
    _i1.RouteDef(
      Routes.discoverpageview,
      page: _i10.Discoverpageview,
    ),
    _i1.RouteDef(
      Routes.trainingPageView,
      page: _i11.TrainingPageView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.ChooseAuthScreen: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.ChooseAuthScreen(),
        settings: data,
      );
    },
    _i3.PlayerLoginview: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.PlayerLoginview(),
        settings: data,
      );
    },
    _i4.CoachLoginview: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.CoachLoginview(),
        settings: data,
      );
    },
    _i5.PlayerSignupView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.PlayerSignupView(),
        settings: data,
      );
    },
    _i6.CoachSignupView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.CoachSignupView(),
        settings: data,
      );
    },
    _i7.PlayerHomeView: (data) {
      final args = data.getArgs<PlayerHomeViewArguments>(
        orElse: () => const PlayerHomeViewArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.PlayerHomeView(key: args.key),
        settings: data,
      );
    },
    _i8.Settingspageview: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.Settingspageview(),
        settings: data,
      );
    },
    _i9.Reportpageview: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.Reportpageview(),
        settings: data,
      );
    },
    _i10.Discoverpageview: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.Discoverpageview(),
        settings: data,
      );
    },
    _i11.TrainingPageView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.TrainingPageView(),
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

  final _i12.Key? key;

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

extension NavigatorStateExtension on _i13.NavigationService {
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
    _i12.Key? key,
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

  Future<dynamic> navigateToSettingspageview([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.settingspageview,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToReportpageview([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.reportpageview,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDiscoverpageview([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.discoverpageview,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTrainingPageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.trainingPageView,
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
    _i12.Key? key,
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

  Future<dynamic> replaceWithSettingspageview([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.settingspageview,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithReportpageview([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.reportpageview,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDiscoverpageview([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.discoverpageview,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTrainingPageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.trainingPageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
