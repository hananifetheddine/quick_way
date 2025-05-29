import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:quick_way/presentation/bindings/initial_binding.dart';
import 'package:quick_way/presentation/resources/langauge_manager.dart';
import 'package:quick_way/presentation/resources/routes_manager.dart';
import 'package:quick_way/presentation/resources/strings_manager.dart';
import 'package:quick_way/presentation/resources/theme_manager.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    GetStorage.init(),
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
  ]);

  runApp(const MyApp());
}

final logger = Logger(printer: PrettyPrinter());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      //TODO: DIR HADI
      //Intl.defaultLocale = ui.window.locale.toString();
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: GetMaterialApp(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          locale: Get.deviceLocale,
          translations: TranslationManager(),
          initialRoute: AppPages.statePage,
          initialBinding: InitialBindings(),
          getPages: AppPages.routes,
          theme: ThemeManager.lightTheme,
          darkTheme: ThemeManager.darkTheme,
          themeMode: ThemeMode.light,
        ),
      );
    });
  }
}
