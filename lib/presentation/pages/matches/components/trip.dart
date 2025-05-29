import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/components/decoration/card.dart';
import 'package:quick_way/presentation/components/default_widgets/cashed_network.dart';
import 'package:quick_way/presentation/components/default_widgets/svg.dart';
import 'package:quick_way/presentation/resources/assets_manager.dart';
import 'package:quick_way/presentation/resources/styles_manager.dart';
import 'package:quick_way/presentation/resources/theme_manager.dart';
import 'package:quick_way/presentation/utils/date.dart';
import 'package:sizer/sizer.dart';

import '../../../../domain/entities/match/match.dart';
import '../../../components/default_widgets/itineraryIcons.dart';
import '../../../controllers/matches/matches.dart';
import '../../../resources/routes_manager.dart';
import '../../../utils/enums.dart';
import 'actions.dart';

class TripMatchComponent extends GetView<MatchesController> {
  const TripMatchComponent({required this.match, super.key});

  final MatchOfPackage match;

  @override
  Widget build(BuildContext context) {
    return radiusCard(
      color: ThemeManager.tertiaryColor,
      child: Column(
        children: [
          ...match.trips.map(
            (trip) => Column(
              children: [
                ListTile(
                  leading:
                      roundedPic(url: trip.courier.profilePicture, size: 27),
                  title: Text(
                    trip.courier.fullName,
                    style: getSemiBoldStyle(),
                  ),
                  subtitle: Text(
                    "${trip.fromStop.toDate?.toStringDMHM()}-${trip.toStop.toDate?.toStringDMHM()}",
                    style: getMediumStyle(fontSize: 9.sp, subTitle: true),
                  ),
                  trailing: IconButton(
                    icon: svgPicture(IconAssets.chatIcon),
                    onPressed: () => Get.toNamed(Routes.chatRoute,
                        arguments: {"courierId": trip.courier.uid}),
                  ),
                ),
                itineraryIcons(LocationType.from, trip.fromStop.location,
                    showIcons: true, listTile: false),
                SizedBox(height: 1.h),
                itineraryIcons(LocationType.to, trip.toStop.location,
                    showIcons: true, listTile: false),
                SizedBox(height: 1.h),
              ],
            ),
          ),
          // dividerModel(),
          ActionsMatchs(match: match)
        ],
      ),
    );
  }
}

/*subtitle: Row(
              children: [
                Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                  size: 14.sp,
                ),
                SizedBox(width: 1.5.w),
                Text(trip.courier.rating, style: getMediumStyle(fontSize: 9.sp))
              ],
            ),*/
