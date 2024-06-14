import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

const keyPreference = 'theme';
const keyHive = 'preferences';

class ThemeController extends GetxController {
  final isDarkMode = false.obs;

  Map<String, ThemeMode> themeModes = {
    'light': ThemeMode.light,
    'dark': ThemeMode.dark,
  };

  // late SharedPreferences preferences;

  static ThemeController get to => Get.find();

  loadThemeMode() async {
    // Usando SharedPreferences

    // preferences = await SharedPreferences.getInstance();
    // String themeText = preferences.getString(keyPreference) ?? 'light';

    // Usando Hive
    Directory dir = await getApplicationDocumentsDirectory();
    Box box = await Hive.openBox(keyHive, path: dir.path);
    String themeText = box.get(keyPreference) ?? 'light';
    isDarkMode.value = themeText == 'dark';
    setMode(themeText);
  }

  Future setMode(String themeText) async {
    ThemeMode themeMode = themeModes[themeText] ?? ThemeMode.light;
    Get.changeThemeMode(themeMode);
    // Usando Hive
    Box box = await Hive.openBox(keyHive);
    await box.put(keyPreference, themeText);

    // Usando Shared Preferences
    // preferences = await SharedPreferences.getInstance();
    // await preferences.setString(keyPreference, themeText);
  }

  changeTheme() {
    setMode(isDarkMode.value ? 'light' : 'dark');
    isDarkMode.value = !isDarkMode.value;
  }
}
