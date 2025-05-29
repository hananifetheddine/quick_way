import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:quick_way/domain/entities/Trip/trip.dart';
import 'package:quick_way/domain/use_case/matches/get_trip_matches.dart';
import 'package:quick_way/domain/use_case/matches/update_state.dart';
import 'package:quick_way/presentation/controllers/home/home.dart';

import '../../../data/network/error_handler.dart';
import '../../../domain/entities/match/match.dart';
import '../../../main.dart';
import '../../components/default_widgets/snack_bar.dart';

class MatchesController extends GetxController {
  MatchesController(this.packageId, this._getTripMatchesUseCase,
      this._updateMatchStateUseCase, this._homeController);

  final GetTripMatchesUseCase _getTripMatchesUseCase;
  final UpdateMatchStateUseCase _updateMatchStateUseCase;
  final HomeController _homeController;
  late String packageId;
  List<MatchOfPackage> trips = [];

  @override
  onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 400), getMatches);
  }

  updateState(MatchOfPackage match) async {
    var res = await _updateMatchStateUseCase.execute(
        Tuple3(packageId, match.matchId, match.state.value.getAction().name));
    res.fold((err) {
      snackBarDetailsModel(snack: SnackCase.error, subTitle: err.message);
    }, (_) {
      showMessageEmpty.value = true;
      match.state.value = match.state.value.nextState();
      snackBarDetailsModel(
          snack: SnackCase.success, subTitle: "Opération done");
      _homeController.getPackages();
    });
  }

  getMatches() async {
    switchState();
    trips.clear();
    var res = await _getTripMatchesUseCase.execute(packageId);
    res.fold((err) {
      failure.value = err;
    }, (data) {
      trips.addAll(data);
    });
    switchState();
  }

  //UI
  var fetching = false.obs;

  var showMessageEmpty = false.obs;
  switchState() => fetching.toggle();
  var failure = Failure.noFailure.obs;
}
