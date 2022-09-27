import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  final Future<SharedPreferences> sharedPreferences;

  PreferencesHelper({required this.sharedPreferences});

  static const notificationScheduleKey = "NOTIFICATION_SCHEDULE_KEY";

  Future<bool> get isNotificationPrefActive async {
    final prefs = await sharedPreferences;
    return prefs.getBool(notificationScheduleKey) ?? false;
  }

  void setNotificationPref(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(notificationScheduleKey, value);
  }
}
