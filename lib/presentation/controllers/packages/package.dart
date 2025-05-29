import 'package:flutter/cupertino.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/components/default_widgets/snack_bar.dart';
import 'package:quick_way/presentation/controllers/bottom_bar/bottom_bar.dart';
import 'package:quick_way/presentation/utils/date.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../../../domain/entities/map/place/place_details.dart';
import '../../../domain/entities/toApi/package/package.dart';
import '../../../domain/use_case/package/new_package.dart';
import '../../../main.dart';
import '../../resources/routes_manager.dart';
import '../../utils/enums.dart';
import '../../utils/pic.dart';
import '../home/home.dart';

class NewPackageController extends GetxController {
  NewPackageController(
    this._addPackageUseCase,
    this._bottomBarController,
    this._homeController,
  );

  final BottomBarController _bottomBarController;
  final HomeController _homeController;

  final AddPackageUseCase _addPackageUseCase;

  late PlaceDetails fromPlace;
  late PlaceDetails toPlace;

  newPackage() async {
    if (formKey.currentState!.validate()) {
      var package = NewPackage(
        title: titleController.text,
        description: descController.text,
        fromLocation: fromPlace.geometry,
        toLocation: toPlace.geometry,
        weight: weightController.text,
        deadLine: deadLine.toStringDMYHM(),
        image: image.value,
        dimensions: dimensionsController.text,
        dropOffFeet:
            dropOffOption.value ? estimatedTimeDropOffFeet.value : null,
        dropOffTransport:
            dropOffOption.value ? estimatedTimeDropOffTransport.value : null,
        collectFeet:
            collectOption.value ? estimatedTimeCollectFeet.value : null,
        collectTransport:
            collectOption.value ? estimatedTimeCollectTransport.value : null,
      );
      logger.i(package.toJson());
      var res = await _addPackageUseCase.execute(package);
      res.fold(
        (err) =>
            snackBarDetailsModel(snack: SnackCase.error, subTitle: err.message),
        (r) {
          Get.back();
          snackBarDetailsModel(
              snack: SnackCase.success, subTitle: "Package added successfully");
          updateHome();
        },
      );
    }
    btnController.stop();
  }

  //locations
  selectLocation(LocationType locationType) async {
    var result = await Get.toNamed(Routes.locationRoute, arguments: {
      "location": locationType == LocationType.from
          ? fromController.text
          : toController.text
    });
    if (result != null) {
      if (locationType == LocationType.from) {
        fromPlace = result;
        fromController.text = fromPlace.formattedAddress;
      } else {
        toPlace = result;
        toController.text = toPlace.formattedAddress;
      }
    }
  }

  updateHome() {
    _bottomBarController.updateIndex(0);
    _homeController.getPackages();
  }

  //picture
  var image = "".obs;

  var registrationDocumentPath = "".obs;

  void takePicture(_) async {
    image.value = await takePic(ratioX: 2, ratioY: 1);
  }

  void deletePicture(_) async {
    image.value = "";
  }

  RxBool dropOffOption = false.obs;
  RxBool collectOption = false.obs;

  updateDropOffOption(newValue) => dropOffOption.value = newValue;

  updateCollectOption(newValue) => collectOption.value = newValue;

  RxInt estimatedTimeDropOffFeet = 10.obs;
  RxInt estimatedTimeDropOffTransport = 10.obs;

  RxInt estimatedTimeCollectFeet = 10.obs;
  RxInt estimatedTimeCollectTransport = 10.obs;

  updateEstimatedTimeDropOffFeet(newValue) =>
      estimatedTimeDropOffFeet.value = newValue;

  updateEstimatedTimeDropOffTransport(newValue) =>
      estimatedTimeDropOffTransport.value = newValue;

  updateEstimatedTimeCollectFeet(newValue) =>
      estimatedTimeCollectFeet.value = newValue;

  updateEstimatedTimeCollectTransport(newValue) =>
      estimatedTimeCollectTransport.value = newValue;

  var fromController = TextEditingController();
  var toController = TextEditingController();
  var dateController = TextEditingController();
  var dimensionsController = TextEditingController();
  var weightController = TextEditingController();
  var typeController = TextEditingController();

  var btnController = RoundedLoadingButtonController();

  DateTime deadLine = DateTime.now();
  onSelectDate(DateTime date) {
    deadLine = date;
    dateController.text = date.toStringDMHM();
  }

  var titleController = TextEditingController();

  var descController = TextEditingController();

  //validators
  final dateValidator = ValidationBuilder().required().build();
  final titleValidator =
      ValidationBuilder().minLength(3).maxLength(50).required().build();
  final descValidator =
      ValidationBuilder().minLength(3).maxLength(250).required().build();
  final dimensionsValidator =
      ValidationBuilder().minLength(3).maxLength(50).required().build();

  final departureValidator =
      ValidationBuilder().minLength(3).maxLength(150).required().build();
  final destinationValidator =
      ValidationBuilder().minLength(3).maxLength(150).required().build();
  final weightValidator =
      ValidationBuilder().minLength(1).maxLength(150).required().build();
  final typeValidator =
      ValidationBuilder().minLength(3).maxLength(150).required().build();

  var formKey = GlobalKey<FormState>();
}
