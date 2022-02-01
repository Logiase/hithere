import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hithere/views/home_page.dart';
import 'package:hithere/views/schedule_view.dart';
import 'package:hithere/views/today_view.dart';
import 'package:styled_widget/styled_widget.dart';

class RootLocation extends BeamLocation<BeamState> {
  RootLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<BeamGuard> get guards => [
        BeamGuard(
          pathPatterns: ['/'],
          check: (context, location) => false,
          beamToNamed: (_, __) {
            return '/home/today';
          },
        ),
      ];

  @override
  List<Pattern> get pathPatterns => ['/', '/home/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    var ret = <BeamPage>[];

    print(state.pathPatternSegments);

    if (state.pathPatternSegments.contains('home')) {
      ret.add(const BeamPage(key: ValueKey('home'), child: HomePage()));
    }

    return ret;
  }
}

class HomeLocation extends BeamLocation<BeamState> {
  HomeLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<Pattern> get pathPatterns => ['/home/today', '/home/schedule'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    var ret = <BeamPage>[];

    print(state.pathPatternSegments);

    if (state.pathPatternSegments.contains('today')) {
      ret.add(const BeamPage(
        key: ValueKey('home-today'),
        title: 'Today',
        child: TodayView(),
      ));
    } else if (state.pathPatternSegments.contains('schedule')) {
      ret.add(const BeamPage(
        key: ValueKey('home-schedule'),
        title: 'Schedule',
        child: ScheduleView(),
      ));
    }

    return ret;
  }
}
