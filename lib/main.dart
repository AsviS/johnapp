import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:repay/screens/startapp/splash_screen.dart';
import 'package:repay/utils/constants.dart';
import 'package:repay/utils/settings_helper.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

main()  async {

  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  final preferences = await StreamingSharedPreferences.instance;
  final settings = MyAppSettings(preferences);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark
  ));
  runApp(MyApp(settings: settings));
  
  }

class MyApp extends StatelessWidget {
  final MyAppSettings settings;

  const MyApp({Key key, this.settings}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColorBrightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(settings: settings,),
    );
  }
}

