import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/components/buttons/animated_button.dart';
import 'package:quick_way/presentation/resources/styles_manager.dart';
import 'package:quick_way/presentation/utils/enums.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:sizer/sizer.dart';

import '../../../../domain/entities/Trip/trip.dart';
import '../../../../domain/entities/match/match.dart';
import '../../../controllers/matches/matches.dart';
import '../../../resources/theme_manager.dart';

class ActionsMatchs extends GetView<MatchesController> {
  ActionsMatchs({required this.match, super.key});

  final MatchOfPackage match;
  final btnController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => switch (match.state.value) {
        MatchState.link => _linkActions(),
        MatchState.pending => _pendingActions(),
        MatchState.rejected => _rejectedActions(),
        MatchState.other => throw UnimplementedError(),
        MatchState.accepted => throw UnimplementedError(),
      },
    );
  }

  _linkActions() {
    return actionsTripButton(
      fontSize: 11,
      textColor: ThemeManager.primaryColor,
      color: Colors.transparent,
      title: "Demander",
      height: 30,
      onTap: () {
        controller.updateState(match);
        btnController.stop();
      },
      controller: btnController,
      state: match.state.value,
    ).paddingSymmetric(horizontal: 7.w, vertical: 2.h);
  }

  _pendingActions() {
    return actionsTripButton(
      fontSize: 11,
      textColor: ThemeManager.primaryColor,
      color: Colors.transparent,
      title: "Annuler",
      height: 30,
      onTap: () {
        controller.updateState(match);
        btnController.stop();
      },
      controller: btnController,
      state: match.state.value,
    ).paddingSymmetric(horizontal: 7.w, vertical: 2.h);
  }

  _rejectedActions() {
    return Row(
      children: [
        Icon(MatchState.rejected.icon),
        SizedBox(width: 3.w),
        Expanded(
          child: Text(
            "le livreur a refusé votre demande",
            style: getMediumStyle(fontSize: 10.sp),
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 7.w, vertical: 2.h);
  }
}
