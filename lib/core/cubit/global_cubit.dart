import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../databases/cache/cache_helper.dart';
import '../services/service_locator.dart';
import 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());
  static GlobalCubit get(BuildContext context) => BlocProvider.of(context);

  //! Nav Bar
  // final PersistentTabController tabController = PersistentTabController();
  // void updateNavBarIndex(int index) {
  //   tabController.index = index;
  //   emit(GlobalInitial());
  // }
  // }

  // final SignInRepo signInRepo = sl<SignInRepo>();
  // GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  //! Language
  String language = sl<CacheHelper>().getCachedLanguage();
  void changeLanguage() {
    language = language == "en" ? "ar" : "en";
    sl<CacheHelper>().cacheLanguage(language);
    emit(GlobalInitial());
  }

  // Future<void> setLanguageAtServer(String? lang) async {
  //   String newLanguage;
  //   if (lang != null) {
  //     newLanguage = lang;
  //   } else {
  //     if (language == 'en') {
  //       newLanguage = 'ar';
  //     } else {
  //       newLanguage = 'en';
  //     }
  //   }
  //   if (sl<CacheHelper>().getData(key: AppConstants.token) != null) {
  //     emit(ChangeLanguageLoading());
  //     final response = await sl<GlobalRepo>().changeLanguageAtTheServer(
  //       newLanguage,
  //     );
  //     response.fold(
  //       (fail) {
  //         emit(ChangeLanguageFailed(fail));
  //       },
  //       (model) {
  //         sl<CacheHelper>().cacheLanguage(newLanguage);
  //         language = sl<CacheHelper>().getCachedLanguage();
  //         emit(ChangeLanguageSuccessfully());
  //       },
  //     );
  //   }
  // }

  // //!Get User Profile
  // User? user;
  // Future<void> getUserProfile() async {
  //   if (sl<CacheHelper>().getData(key: AppConstants.token) != null) {
  //     emit(GlobalLoading());
  //     final response = await sl<SignInRepo>().getUserProfile();
  //     response.fold(
  //       (fail) {
  //         emit(FaildToGetProfile());
  //         Future.delayed(const Duration(seconds: 3), () {
  //           getUserProfile();
  //         });
  //       },
  //       (model) {
  //         user = model;
  //         emit(GlobalInitial());
  //         postFcmToken();
  //       },
  //     );
  //   }
  // }

  // Future<void> updateUser(User? newUser) async {
  //   user = newUser;
  //   emit(GlobalInitial());
  // }

  // // Future<void> updateUI() async {
  // //   emit(GlobalInitial());
  // // }

  // //! Location
  // String? currentAddress;
  // double? currentLat;
  // double? currentLong;
  // Future<void> getCurrentLocation() async {
  //   final loc.Location location = loc.Location();
  //   bool serviceEnabled;
  //   loc.PermissionStatus permissionGranted;

  //   // Check if location services are enabled
  //   serviceEnabled = await location.serviceEnabled();
  //   if (!serviceEnabled) {
  //     serviceEnabled = await location.requestService();
  //     if (!serviceEnabled) {
  //       Print.error('Location services are disabled.');
  //       return;
  //     }
  //   }

  //   // Check for permission status
  //   permissionGranted = await location.hasPermission();
  //   if (permissionGranted == loc.PermissionStatus.denied) {
  //     permissionGranted = await location.requestPermission();
  //     if (permissionGranted != loc.PermissionStatus.granted) {
  //       Print.error('Location permission denied.');
  //       return;
  //     }
  //   }

  //   try {
  //     final loc.LocationData locationData = await location.getLocation();

  //     final double? latitude = locationData.latitude;
  //     final double? longitude = locationData.longitude;

  //     // Convert coordinates to address
  //     final List<Placemark> placemarks = await placemarkFromCoordinates(
  //       latitude ?? 0,
  //       longitude ?? 0,
  //     );

  //     String newAddress;

  //     if (placemarks.isNotEmpty) {
  //       final Placemark place = placemarks[0];

  //       newAddress = [
  //         if (place.name != null && place.name!.isNotEmpty) place.name,
  //         if (place.street != null && place.street!.isNotEmpty) place.street,
  //         if (place.subLocality != null && place.subLocality!.isNotEmpty)
  //           place.subLocality,
  //         if (place.locality != null && place.locality!.isNotEmpty)
  //           place.locality,
  //         if (place.administrativeArea != null &&
  //             place.administrativeArea!.isNotEmpty)
  //           place.administrativeArea,
  //         if (place.country != null && place.country!.isNotEmpty) place.country,
  //       ].join(", ");
  //     } else {
  //       newAddress = "Unknown Address (Lat: $latitude, Lng: $longitude)";
  //     }

  //     Print.warning('Current Location: $newAddress');
  //     currentAddress = newAddress;
  //     currentLat = latitude;
  //     currentLong = longitude;
  //   } on Exception catch (e) {
  //     Print.warning('Location request: $e');
  //   }
  //   emit(GlobalInitial());
  // }

  // Future<void> postFcmToken() async {
  //   if (sl<CacheHelper>().getData(key: AppConstants.token) != null) {
  //     final fcmToken = await NotificationHandler.getToken();
  //     final response = await sl<ProfileRepo>().setDeviceData(
  //       SetDeviceDataRequestModel(fcmToken: fcmToken ?? ""),
  //     );
  //     response.fold((l) async {
  //       await Future.delayed(const Duration(seconds: 30), () {
  //         postFcmToken();
  //       });
  //     }, (r) => Print.success(r.message ?? 'FCM Token Posted Successfully'));
  //   }
  // }

  // //! Check Authenticated
  // bool isAuthenticated() {
  //   final bool isAuthenticated =
  //       sl<CacheHelper>().getData(key: AppConstants.token) != null;
  //   if (!isAuthenticated) {
  //     updateNavBarIndex(0);
  //     navigatorKey.currentState!.push(
  //       MaterialPageRoute(
  //         builder: (_) {
  //           return const SignInScreen();
  //         },
  //       ),
  //     );
  //     return false;
  //   }
  //   return true;
  // }

  // String? appVersion;
  // Future<void> getAppVersion() async {
  //   final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   appVersion = packageInfo.version;
  // }

  // bool isNotificationEnabled =
  //     sl<CacheHelper>().getDataBool(key: "isNotificationEnabled") ?? true;
  // void toggleNotification() {
  //   isNotificationEnabled = !isNotificationEnabled;
  //   sl<CacheHelper>().saveData(
  //     key: "isNotificationEnabled",
  //     value: isNotificationEnabled,
  //   );
  //   emit(GlobalInitial());
  // }

  // bool isBiometricEnabled =
  //     sl<CacheHelper>().getDataBool(key: "isBiometricEnabled") ?? false;
  // void toggleBiometric() {
  //   isBiometricEnabled = !isBiometricEnabled;
  //   sl<CacheHelper>().saveData(
  //     key: "isBiometricEnabled",
  //     value: isBiometricEnabled,
  //   );
  //   emit(GlobalInitial());
  // }

  // HomeDocumentsStatusData? documentsStatus;
  // double get completeProfileProgress =>
  //     documentsStatus?.completionProgress ?? 0;

  // String get completeProfileProgressLabel =>
  //     '${(completeProfileProgress * 100).round()}%';
  // Future<void> getDocumentsStatus() async {
  //   final response = await sl<HomeRepo>().getDocumentsStatus();

  //   response.fold(
  //     (l) {
  //       Print.error(l);
  //     },
  //     (r) {
  //       documentsStatus = r.data;
  //       emit(GlobalInitial());
  //     },
  //   );
  // }
}
