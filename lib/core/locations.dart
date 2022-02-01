import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hithere/providers/settings/settings_provider.dart';
import 'package:hithere/views/home_page.dart';
import 'package:hithere/views/schedule_view.dart';
import 'package:hithere/views/settings_page.dart';
import 'package:hithere/views/today_view.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

class RootLocation extends BeamLocation<BeamState> {
  RootLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<BeamGuard> get guards => [
        BeamGuard(
          pathPatterns: ['/'],
          check: (context, location) => false,
          beamToNamed: (origin, target) {
            return '/home';
          },
        ),
      ];

  // @override
  // Widget builder(BuildContext context, Widget navigator) => MultiProvider(
  //       providers: [
  //         ChangeNotifierProvider(create: (_) => SettingsProvider()),
  //       ],
  //       child: navigator,
  //     );

  @override
  List<Pattern> get pathPatterns => ['/', '/home/*', '/settings'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    var ret = <BeamPage>[];

    if (state.pathPatternSegments.contains('home')) {
      ret.add(const BeamPage(key: ValueKey('home'), child: HomePage()));
    }
    if (state.pathPatternSegments.contains('settings')) {
      //  ret.addAll(RootLocation(state.routeInformation).buildPages(context, state));
      ret.add(const BeamPage(key: ValueKey('settings'), child: SettingsPage()));
    }

    return ret;
  }
}

class HomeLocation extends BeamLocation<BeamState> {
  HomeLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<BeamGuard> get guards => [
        BeamGuard(
            pathPatterns: ['/home'],
            check: (_, __) => false,
            beamToNamed: (_, __) => '/home/today'),
      ];

  @override
  List<Pattern> get pathPatterns => ['/home/today', '/home/schedule'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    var ret = <BeamPage>[];

    if (state.pathPatternSegments.contains('today')) {
      ret.add(const BeamPage(
        key: ValueKey('home-today'),
        title: 'Home-Today',
        child: TodayView(),
      ));
    } else if (state.pathPatternSegments.contains('schedule')) {
      ret.add(const BeamPage(
        key: ValueKey('home-schedule'),
        title: 'Home-Schedule',
        child: ScheduleView(),
      ));
    }

    if (ret.isEmpty) {
      ret.add(const BeamPage(
        key: ValueKey('home-home'),
        title: 'Home-Home',
        child: Text('error'),
      ));
    }

    return ret;
  }
}
