import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/common/logs.dart';
import '../../core/constants/app_constants.dart';
import '../../core/databases/cache/cache_helper.dart';
import '../../core/locale/locale_controller.dart';
import '../../core/services/service_locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    checkingBeforeNavigation();
  }

  void checkingBeforeNavigation() async {
    final String? token = sl<CacheHelper>().getData(key: AppConstants.token);
    final bool? isOnboardingCompleted = sl<CacheHelper>().getData(
      key: AppConstants.onBoarding,
    );

    if (token != null) {
      Print.success("TOKEN: $token");
    } else {
      Print.error("TOKEN: $token");
    }
    Future.delayed(const Duration(seconds: 4), () async {
      if (token != null) {
        //! Home screen
        // navigateAndRemoveUntil(context: context, screen: const BaseView());
      } else {
        if (isOnboardingCompleted != null && isOnboardingCompleted == true) {
          //! Sign In Screen
          // navigateAndRemoveUntil(
          //   context: context,
          //   screen: const SignInScreen(),
          // );
        } else {
          sl<CacheHelper>().saveData(key: AppConstants.onBoarding, value: true);
          //! Onboarding screen
          // navigateAndRemoveUntil(
          //   context: context,
          //   screen: const OnboardingScreen(),
          // );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "splashScreen".tr,
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<LocaleController>().toggleLanguage();
        },
        child: const Icon(Icons.language),
      ),
    );
  }
}
