import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hithere/core/locations.dart';
import 'package:styled_widget/styled_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: const Text('Drawer Header').center()),
            ListTile(
              title: const Text('Today'),
              onTap: () {
                context.beamToNamed('/home/today');

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Schedule'),
              onTap: () {
                context.beamToNamed('/home/schedule');

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Beamer(
        routerDelegate: BeamerDelegate(
            locationBuilder: (routeInformation, _) =>
                HomeLocation(routeInformation)),
      ),
    );
  }
}
