import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  static const String arPath = 'assets/translations/ar.json';
  static const String enPath = 'assets/translations/en.json';

  static late Map<String, Map<String, String>> _translations;
  static bool _isInitialized = false;

  static Future<void> initialize() async {
    if (_isInitialized) return;

    _translations = {
      'en': await _loadLanguage(enPath),
      'ar': await _loadLanguage(arPath),
    };

    _isInitialized = true;
  }

  static Future<Map<String, String>> _loadLanguage(String path) async {
    try {
      final jsonString = await rootBundle.loadString(path);
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      return jsonMap.cast<String, String>();
    } catch (e) {
      debugPrint('Error loading language from $path: $e');
      return {};
    }
  }

  @override
  Map<String, Map<String, String>> get keys => _translations;
}

extension StringTranslation on String {
  String tr() => trParams();
}


