import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_notifier.dart';
import 'package:TrailSync/gps_settings_notifier.dart';

class SettingsWidget extends StatefulWidget {
  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  Widget azulejo(Icon icon, String title, Widget widget) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [icon, Text(title, style: TextStyle(color: Colors.black)), widget],
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.settings),
      // In _SettingsWidgetState's onPressed:
onPressed: () {
  // Get ThemeNotifier BEFORE opening dialog
  final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
  
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    pageBuilder: (_, __, ___) {
      return Builder(  // Add Builder here
        builder: (dialogContext) {
          return Align(
            alignment: Alignment.center,
            child: Material(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Container(
  width: MediaQuery.of(dialogContext).size.width * 0.7,
  height: MediaQuery.of(dialogContext).size.height * 0.20,
  decoration: BoxDecoration(
    color: Colors.white70,
    borderRadius: BorderRadius.circular(20), // Adjust this value for corner radius
  ),
  child: Column(
    children: [
      SizedBox(height: 10),
      Text(
        "Settings",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
          color: Colors.blueGrey
        ),
      ),
      SizedBox(height: 15),
      azulejo(
        Icon(Icons.brush, color: Colors.blueGrey),
        "Dark theme",
        SwitchTheme(themeNotifier: themeNotifier),
      ),
      azulejo(
        Icon(Icons.battery_0_bar_sharp, color: Colors.blueGrey),
        "Power saving",
        SwitchBattery()
      ),
    ],
  ),
),),
          );
        },
      );
    },
  );
},
    );
  }
}

class SwitchTheme extends StatelessWidget {
  final ThemeNotifier themeNotifier;
  
  const SwitchTheme({super.key, required this.themeNotifier});

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: themeNotifier.isDarkMode,
      activeColor: Colors.deepPurple,
      onChanged: (bool value) {
        themeNotifier.toggleTheme();
      },
    );
  }
}

class SwitchBattery extends StatelessWidget {
  const SwitchBattery({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GpsSettingsNotifier>(
      builder: (context, gpsNotifier, child) {
        return Switch(
          value: gpsNotifier.isBatterySaving,
          activeColor: Colors.deepPurple,
          onChanged: (bool value) {
            gpsNotifier.toggleBatterySaving();
          },
        );
      },
    );
  }
}