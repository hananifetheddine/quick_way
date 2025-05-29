import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../components/default_widgets/loading_indicator.dart';
import '../../controllers/splash/splash.dart';
import '../../resources/theme_manager.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: ThemeManager.primaryColor,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //SvgPicture.asset(LogoAssets.splashLogo),
            //SizedBox(height: 6.h),
            loadingIndicator(splash: true),
          ],
        ),
      ),
    ));
  }
}
