import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/flavors/build_config.dart';
import 'app/flavors/env_config.dart';
import 'app/flavors/environment.dart';
import 'app/my_app.dart';
import 'app/core/config/app_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'deep_link.dart';

Future<void> main() async {
  Bloc.observer = AppBlocObserver();

  EnvConfig devConfig = EnvConfig(
    appName: "",
    appVersion: "0.1",
    apiBaseUrl: "",
    webBaseUrl: "",
    shouldCollectCrashLog: true,
    iOSAppId: '',
    androidAppId: '',
  );

  // BuildConfig.instantiate(
  //   envType: Environment.DEVELOPMENT,
  //   envConfig: devConfig,
  // );

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  //FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  // // Camera
  // cameras = await availableCameras();
  // print('available cameras. ${cameras.length}');
  // // Auth guard
  // final initialDeepLink = await getInitialDeepLink();
  // final directory = await getApplicationDocumentsDirectory();
  // final localManager = LocalManager(directory);
  // final authenRepository = AuthenRepository();
  // final initialAuthenState = AuthenState(
  //   authenModel: await authenRepository.getAuthenModelFromSecureStorage(),
  //   authenticatedUser:
  //       await authenRepository.getAuthenticatedUserFromSecureStorage(),
  // );
  runApp(const MyApp(
      // initialDeepLink,
      // localManager,
      // initialAuthenState: initialAuthenState,
      ));
}
