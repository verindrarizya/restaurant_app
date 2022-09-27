import 'package:flutter/material.dart';
import 'package:restaurant_app/data/preferences/preferences_helper.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  PreferencesProvider({required this.preferencesHelper}) {
    _getNotificationSchedulePreference();
  }

  bool _isNotificationScheduleActive = false;
  bool get isNotificationScheduleActive => _isNotificationScheduleActive;

  void _getNotificationSchedulePreference() async {
    _isNotificationScheduleActive =
        await preferencesHelper.isNotificationPrefActive;
    notifyListeners();
  }

  void enableNotificationSchedulePreference(bool value) {
    preferencesHelper.setNotificationPref(value);
    _getNotificationSchedulePreference();
  }
}
