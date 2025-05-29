import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../app/local.dart';
import '../../../domain/entities/map/place/place.dart';
import '../../../domain/entities/map/place/place_details.dart';
import '../../../domain/entities/map/place/prediction.dart';
import '../../../domain/use_case/map/auto_complete_use_case.dart';
import '../../../domain/use_case/map/place_by_id_use_case.dart';
import '../../components/default_widgets/snack_bar.dart';
import '../../utils/enums.dart';
import '../../utils/session_token.dart';

class LocationController extends GetxController {
  LocationController(this._placeByIdUseCase, this._autoCompleteUseCase);

  late PlaceDetails placeDetails;

  final AutoCompleteUseCase _autoCompleteUseCase;
  final PlaceByIdUseCase _placeByIdUseCase;

  List<Prediction> predictions = [];
  List<PlaceDetails> historySearch = LocalService.historySearch;

  @override
  void onInit() {
    String? location = Get.arguments["location"];
    if (location != null && location.isNotEmpty) {
      searchController.text = location;
      _autoComplete();
    }
    super.onInit();
  }

  var searchController = TextEditingController();

  _autoComplete() async {
    _switchState();

    var res = await _autoCompleteUseCase
        .execute(Tuple2(searchController.text, token));

    res.fold((err) {
      snackBarDetailsModel(snack: SnackCase.error, subTitle: err.message);
    }, (predictions) {
      this.predictions = predictions;
      update(["predictions"]);
    });
    _switchState();
  }

  _searchPlaceById(placeId) async {
    _switchStatePlace();
    var res = await _placeByIdUseCase.execute(Tuple2(placeId, token));
    res.fold(
        (error) => snackBarDetailsModel(
            snack: SnackCase.error, subTitle: error.message), (data) {
      placeDetails = data;
      _addPlaceToHistory();
      goBack();
    });
    _updateToken();
    _switchStatePlace();
  }

  onChangeInputLocations(String value) {
    debounceTimer?.cancel();
    debounceTimer = Timer(
      const Duration(milliseconds: 1000),
      () {
        if (value.length > 4) {
          _updateSource(PredictionSource.api);
          _autoComplete();
        } else {
          _updateSource(predictions.isEmpty
              ? PredictionSource.local
              : PredictionSource.api);
        }
      },
    );
  }

  selectPlace(Place place) {
    if (place is Prediction) {
      _searchPlaceById(place.placeId);
    } else {
      placeDetails = place as PlaceDetails;
      goBack();
    }
  }

  _addPlaceToHistory() {
    historySearch.add(placeDetails);
    LocalService.addPlaceToHistory(placeDetails);
  }

  goBack() => Get.back(result: placeDetails);

  //token
  String token = Uuid().generateV4();
  _updateToken() => token = Uuid().generateV4();

  //ui
  RxBool fetching = false.obs;
  RxBool fetchingPlace = false.obs;

  _switchState() => fetching.toggle();

  _switchStatePlace() => fetchingPlace.toggle();

  _updateSource(PredictionSource source) => currentSource.value = source;

  Rx<PredictionSource> currentSource = PredictionSource.local.obs;
  Timer? debounceTimer;
}
