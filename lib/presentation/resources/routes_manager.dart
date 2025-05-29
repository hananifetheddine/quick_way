import 'package:get/get.dart';
import 'package:quick_way/presentation/bindings/chat.dart';
import 'package:quick_way/presentation/pages/auth/login/login.dart';
import 'package:quick_way/presentation/pages/auth/registration/registration.dart';
import 'package:quick_way/presentation/pages/chat/chat/chat.dart';
import 'package:quick_way/presentation/pages/location/location.dart';
import 'package:quick_way/presentation/pages/new_package/package.dart';

import '../../app/local.dart';
import '../bindings/auth.dart';
import '../bindings/home.dart';
import '../bindings/location.dart';
import '../bindings/packages.dart';
import '../bindings/splash.dart';
import '../pages/auth/login/verify_otp_view.dart';
import '../pages/botttom_bar/bottom_bar.dart';
import '../pages/splash/splash.dart';
import '../pages/welcome/welcome.dart';
import '../utils/enums.dart';

class Routes {
  static const String loginRoute = "/login";
  static const String recaptchaRoute = "/recaptcha";
  static const String verifyOTPRoute = "/verify";
  static const String registerRoute = "/register";
  static const String homeRoute = "/home";
  static const String customizeRoute = "/information";
  static const String selectOnMapRoute = "/select_map";
  static const String splashRoute = "/splash";
  static const String welcomeRoute = "/welcome";
  static const String locationRoute = "/location";

  static const String newPackage = "/packages/new";

  static const String chatRoute = "/chat";

}

class AppPages {
  static String statePage = Routes.splashRoute;

  static String pageByState() {
    switch (LocalService.state) {
      case AccountState.noAccount:
        return Routes.welcomeRoute;
      case AccountState.activated:
        return Routes.homeRoute;
      case AccountState.deactivated:
        //todo:change here
        return "Routes.deactivatedRoute";
    }
  }

  static final routes = [
    GetPage(
        name: Routes.splashRoute,
        page: () => const SplashView(),
        binding: SplashBinding()),
    GetPage(
      name: Routes.welcomeRoute,
      page: () => const WelcomeView(),
    ),
    GetPage(
        name: Routes.loginRoute,
        page: () => const LoginView(),
        binding: LoginBinding()),
    GetPage(
      name: Routes.verifyOTPRoute,
      page: () => const VerifyOTPView(),
    ),
    GetPage(
        name: Routes.registerRoute,
        page: () => const RegistrationView(),
        binding: RegistrationBinding()),
    GetPage(
        name: Routes.homeRoute,
        page: () => const BottomBarView(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.locationRoute,
        page: () => const LocationView(),
        binding: LocationBinding()),
    GetPage(
        name: Routes.newPackage,
        page: () => const NewPackageView(),
        binding: NewPackageBinding()),
    GetPage(
        name: Routes.chatRoute,
        page: () => const ChatView(),
        binding: ChatBinding()),
  ];
}
