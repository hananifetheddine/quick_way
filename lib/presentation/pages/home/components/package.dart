import 'package:dartz/dartz.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_way/domain/entities/package/package.dart';
import 'package:quick_way/presentation/pages/home/components/state.dart';
import 'package:quick_way/presentation/resources/styles_manager.dart';
import 'package:quick_way/presentation/resources/theme_manager.dart';
import 'package:sizer/sizer.dart';

import '../../../components/default_widgets/cashed_network.dart';
import '../../../components/default_widgets/itineraryIcons.dart';
import '../../../utils/enums.dart';
import '../../matches/matches.dart';

class PackageComponentHome extends StatelessWidget {
  const PackageComponentHome({super.key, required this.package});

  final Package package;

  @override
  Widget build(BuildContext context) {
    bool expanded = false;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.sp)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StatefulBuilder(builder: (context, setState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 1.h),
                Row(
                  children: [
                    Text(
                      package.title,
                      style: getSemiBoldStyle(fontSize: 15.sp),
                    ),
                    const Spacer(),
                    Icon(Icons.more_horiz_rounded, size: 23.sp),
                  ],
                ),
                SizedBox(height: 0.5.h),
                ExpandableText(
                  package.description,
                  expandText: 'show more',
                  onExpandedChanged: (newExpanded) {
                    setState(() => expanded = newExpanded);
                  },
                  maxLines: 2,
                  linkColor: ThemeManager.primaryColor,
                  animationDuration: const Duration(milliseconds: 700),
                  animation: true,
                  collapseOnTextTap: true,
                  style: getMediumStyle(subTitle: true, fontSize: 10.sp),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  "${package.dimensions} cm   ${package.weight} Kg ",
                  style: getMediumStyle(fontSize: 11.sp),
                ),
                SizedBox(height: 1.h),
              ],
            ).paddingSymmetric(horizontal: 3.w);
          }),
          SizedBox(
            width: 100.w,
            child: cachedNetworkModel(url: package.image),
          ),
          Row(
            children: [
              Expanded(
                  child:
                      itineraryIcons(LocationType.from, package.fromLocation)),
              SizedBox(width: 4.w),
              Icon(
                Icons.arrow_forward_rounded,
                size: 14.sp,
              ),
              SizedBox(width: 4.w),
              Expanded(
                  child: itineraryIcons(LocationType.to, package.toLocation)),
            ],
          ).paddingSymmetric(horizontal: 4.w),
          Divider(
            height: 0,
            color: Colors.grey.withOpacity(0.4),
          ),
          SizedBox(height: 2.h),
          InkWell(
            onTap: () => Get.bottomSheet(MatchesView(packageId: package.id),
                isScrollControlled: true),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: MatchState.importantStates
                  .map((state) =>
                      matchStateComponent(package.matchsByState(state), state))
                  .toList(),
            ).paddingSymmetric(horizontal: 4.w),
          ),
          SizedBox(height: 2.h)
        ],
      ),
    );
  }
}
