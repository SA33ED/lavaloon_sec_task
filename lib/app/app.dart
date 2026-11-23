import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/cubit/global_cubit.dart';
import '../core/cubit/global_state.dart';
import '../core/locale/locale_controller.dart';
import '../core/locale/localization_settings.dart';
import '../core/locale/translations.dart';
import '../core/theme/app_dark_theme.dart';
import '../core/theme/app_theme.dart';
import '../features/splash/splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        return GetBuilder<LocaleController>(
          init: LocaleController(),
          builder: (localeCtrl) {
            return ScreenUtilInit(
              designSize: const Size(375, 812),
              builder: (context, child) {
                return GetMaterialApp(
                  navigatorKey: navigatorKey,
                  builder: (context, child) {
                    final mediaQueryData = MediaQuery.of(context);
                    final scale = mediaQueryData.textScaler.clamp(
                      minScaleFactor: 1.0,
                      maxScaleFactor: 1.0,
                    );
                    return MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaler: scale),
                      child: child!,
                    );
                  },
                  debugShowCheckedModeBanner: false,
                  
                  //! Localization Settings with GetX
                  locale: localeCtrl.locale,
                  fallbackLocale: const Locale('en', 'US'),
                  translations: AppTranslations(),
                  supportedLocales: supportedLocalesList,
                  //! Material and Cupertino localizations
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  
                  //! App Scroll Behavior
                  scrollBehavior: ScrollConfiguration.of(context)
                      .copyWith(physics: const ClampingScrollPhysics()),

                  //! Routing
                  home: const SplashScreen(),
                  
                  //! Theme
                  theme: getAppTheme(),
                  darkTheme: getDarkAppTheme(),
                  themeMode: ThemeMode.light,
                );
              },
            );
          },
        );
      },
    );
  }
}



