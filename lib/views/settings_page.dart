import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hithere/providers/settings/theme_settings.dart';
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
    final ThemeSettings themeProviderRef = Provider.of(context);

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
                themeProviderRef.themeMode = v;
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
          SettingsTile(
            leading: const Icon(Icons.palette),
            title: const Text('Theme Color'),
            value: PopupMenuButton<String>(
              child: Text(themeProviderRef.themeColorString),
              onSelected: (v) {
                themeProviderRef.setTheme(v);
              },
              itemBuilder: (BuildContext context) => ThemeSettings.mdColors.keys
                  .map((e) => PopupMenuItem(child: Text(e), value: e))
                  .toList(),
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
