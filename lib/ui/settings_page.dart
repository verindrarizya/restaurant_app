import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/preferences_provider.dart';
import 'package:restaurant_app/provider/scheduling_provider.dart';

class SettingsPage extends StatefulWidget {
  static String routeName = "/settings_page";

  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Consumer<PreferencesProvider>(
        builder: (context, preferenceProvider, _) {
          return ListView(
            children: [
              ListTile(
                title: Text(
                  "Schedule Notification at 11:00",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                trailing: Consumer<SchedulingProvider>(
                  builder: (context, scheduleProvider, _) {
                    return Switch(
                      value: preferenceProvider.isNotificationScheduleActive,
                      onChanged: (value) {
                        scheduleProvider.scheduledNotification(value);
                        preferenceProvider
                            .enableNotificationSchedulePreference(value);
                      },
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
