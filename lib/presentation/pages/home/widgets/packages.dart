import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/controllers/home/home.dart';
import 'package:quick_way/presentation/pages/base_view/fetch_data.dart';
import 'package:quick_way/presentation/pages/home/components/package.dart';
import 'package:sizer/sizer.dart';

class PackagesHome extends GetView<HomeController> {
  const PackagesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseViewGetData(
        downloading: controller.fetching.value,
        failure: controller.failure.value,
        data: controller.packages,
        noDataMessage: "Vous n'avez pas des colis",
        child: RefreshIndicator(
          onRefresh: controller.getPackages,
          child: Container(
            color: Colors.grey.withOpacity(0.3),
            child: ListView.separated(
              padding: EdgeInsets.only(top: 2.h, bottom: 12.h),
              itemBuilder: (_, index) =>
                  PackageComponentHome(package: controller.packages[index]),
              itemCount: controller.packages.length,
              separatorBuilder: (_, __) => SizedBox(height: 2.h),
            ),
          ),
        ),
      ),
    );
  }
}
