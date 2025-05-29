import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/controllers/home/home.dart';
import 'package:quick_way/presentation/pages/home/widgets/app_bar.dart';
import 'package:quick_way/presentation/pages/home/widgets/packages.dart';
import 'package:sizer/sizer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2.h),
        appBarHome(),
        SizedBox(height: 1.h),
        Expanded(child: PackagesHome()),
      ],
    );
  }
}
