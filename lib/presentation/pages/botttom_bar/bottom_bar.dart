import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/components/default_widgets/svg.dart';
import 'package:quick_way/presentation/controllers/bottom_bar/bottom_bar.dart';
import 'package:quick_way/presentation/resources/theme_manager.dart';
import 'package:sizer/sizer.dart';

import '../../resources/routes_manager.dart';

class BottomBarView extends GetView<BottomBarController> {
  const BottomBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () => Get.toNamed(Routes.newPackage),
            backgroundColor: ThemeManager.primaryColor,
            child: const Icon(Icons.add_rounded),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: PageView(
            controller: controller.controller,
            physics: const NeverScrollableScrollPhysics(),
            children: controller.screens,
          ),
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            backgroundColor: ThemeManager.backgroundColor,
            notchSmoothness: NotchSmoothness.softEdge,
            activeIndex: controller.index.value,
            gapLocation: GapLocation.center,
            leftCornerRadius: 32,
            rightCornerRadius: 32,
            onTap: controller.updateIndex,
            itemCount: 4,
            tabBuilder: (int index, bool isActive) => Padding(
              padding: EdgeInsets.all(index == 1 ? 10.5.sp : 12.sp),
              child: svgPicture(controller.icons[index],
                  color:
                      ThemeManager.primaryColor.withOpacity(isActive ? 1 : 0.6),
                  oppositeColor: false),
            ),
          ),
        ),
      ),
    );
  }
}
