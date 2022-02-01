import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hithere/providers/settings/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Beamer.of(context).beamToNamed('/');
          },
        ),
      ),
      body: _buildSettingsList(context),
    );
  }

  Widget _buildSettingsList(BuildContext context) {
    final ThemeProvider themeProviderRef = Provider.of(context);

    return SettingsList(sections: [
      SettingsSection(
        title: const Text('Theme'),
        tiles: [
          SettingsTile(
            leading: const Icon(Icons.mode_night),
            title: const Text('Theme Mode'),
            value: PopupMenuButton<ThemeMode>(
              child: Text(themeProviderRef.themeModeString),
              onSelected: (v) {
                themeProviderRef.setThemeMode(v);
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem<ThemeMode>(
                    child: Text('System'), value: ThemeMode.system),
                const PopupMenuItem(
                    child: Text('Light'), value: ThemeMode.light),
                const PopupMenuItem(child: Text('Dark'), value: ThemeMode.dark),
              ],
            ),
          ),
        ],
      ),
    ]);
  }
}

// DropdownButton(
//               value: themeProviderRef.themeMode,
//               onChanged: (value) {},
//               items: ThemeMode.values
//                   .map<DropdownMenuItem<ThemeMode>>((e) => DropdownMenuItem(
//                         value: e,
//                         child: Text(e.toString()),
//                       ))
//                   .toList(),
//             ),