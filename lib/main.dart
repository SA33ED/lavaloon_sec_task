import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/app.dart';
import 'core/cubit/global_cubit.dart';
import 'core/databases/cache/cache_helper.dart';
import 'core/locale/translations.dart';
import 'core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  //! Initialize Translations
  await AppTranslations.initialize();
  
  //! Screen Util
  await ScreenUtil.ensureScreenSize();
  
  //! Service Locator (Dependency Injection)
  initServiceLocator();
  
  //! Cache Helper
  await sl<CacheHelper>().init();
  
  //! Orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  //! Status Bar Settings
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  //! Application Starts From here.
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => sl<GlobalCubit>())],
      child: const MyApp(),
    ),
  );
}



