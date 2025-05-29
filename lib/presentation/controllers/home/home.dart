import 'package:get/get.dart';
import 'package:quick_way/data/network/error_handler.dart';
import 'package:quick_way/domain/entities/Trip/trip.dart';
import 'package:quick_way/domain/use_case/package/get_packages.dart';

import '../../../domain/entities/package/package.dart';

class HomeController extends GetxController {
  HomeController(this._getPackagesUseCase);

  final GetPackagesUseCase _getPackagesUseCase;
  List<Package> packages = <Package>[];

  @override
  onInit() {
    super.onInit();
    getPackages();
  }

  Future<void> getPackages() async {
    switchState();
    packages.clear();
    final result = await _getPackagesUseCase.execute();
    result.fold(
      (failure) {
        this.failure.value = failure;
      },
      (packages) {
        this.packages.addAll(packages);
      },
    );
    switchState();
  }

  //UI
  final Rx<Failure> failure = Failure.noFailure.obs;
  RxBool fetching = false.obs;

  switchState() => fetching.toggle();

  void updateStates(TripMatch trip) {}
}
