import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/components/buttons/animated_button.dart';
import 'package:quick_way/presentation/components/default_widgets/app_bar.dart';
import 'package:sizer/sizer.dart';

import '../../components/default_widgets/add_document.dart';
import '../../components/default_widgets/drop_down_values.dart';
import '../../components/text_fields/date_field.dart';
import '../../components/text_fields/default_text_field.dart';
import '../../controllers/packages/package.dart';
import '../../resources/assets_manager.dart';
import '../../resources/styles_manager.dart';
import '../../utils/enums.dart';

class NewPackageView extends GetView<NewPackageController> {
  const NewPackageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBarModel(title: "Nouveau colis"),
        body: SingleChildScrollView(
          child: Obx(
            () => Form(
              key: controller.formKey,
              child: Column(
                children: [
                  DefaultInput(
                    hintText: "Titre",
                    controller: controller.titleController,
                    validate: controller.titleValidator,
                  ),
                  SizedBox(height: 2.h),
                  DefaultInput(
                    hintText: "Description",
                    controller: controller.descController,
                    validate: controller.descValidator,
                  ),
                  SizedBox(height: 2.h),
                  document(
                    path: controller.image,
                    tapNoPic: controller.takePicture,
                    tapDeletePic: controller.deletePicture,
                  ),
                  SizedBox(height: 2.h),
                  DefaultInput(
                    hintText: "Départ",
                    controller: controller.fromController,
                    readOnly: true,
                    icon: IconAssets.placeIcon,
                    tap: () => controller.selectLocation(LocationType.from),
                    validate: controller.departureValidator,
                  ),
                  SizedBox(height: 2.h),
                  DefaultInput(
                    hintText: "Destination",
                    controller: controller.toController,
                    readOnly: true,
                    icon: IconAssets.targetIcon,
                    tap: () => controller.selectLocation(LocationType.to),
                    validate: controller.destinationValidator,
                  ),
                  SizedBox(height: 2.h),
                  InputDateComponent(
                    initialDate: DateTime.now().add(const Duration(days: 1)),
                    firstDate: DateTime.now().add(const Duration(hours: 1)),
                    hintText: "Date limite",
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                    controller: controller.dateController,
                    onSelect: controller.onSelectDate,
                    validate: controller.dateValidator,
                  ),
                  SizedBox(height: 2.h),
                  DefaultInput(
                    hintText: "Dimensions ( cm ) ",
                    controller: controller.dimensionsController,
                    validate: controller.dimensionsValidator,
                  ),
                  SizedBox(height: 2.h),
                  DefaultInput(
                    hintText: "Pois ( KG )",
                    controller: controller.weightController,
                    validate: controller.weightValidator,
                  ),
                  SizedBox(height: 2.h),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Pouvez-vous apporter l’article au livreur ?",
                      style: getSemiBoldStyle(fontSize: 10.sp, subTitle: true),
                    ),
                    value: controller.dropOffOption.value,
                    onChanged: controller.updateDropOffOption,
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  ),
                  Visibility(
                    visible: controller.dropOffOption.isTrue,
                    child: Row(
                      children: [
                        Text(
                          "Temps estimé à pieds :",
                          style:
                              getSemiBoldStyle(fontSize: 11.sp, subTitle: true),
                        ),
                        SizedBox(width: 3.w),
                        dropDownMinutes(
                            controller.estimatedTimeDropOffFeet.value,
                            controller.updateEstimatedTimeDropOffFeet),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: controller.dropOffOption.isTrue,
                    child: Row(
                      children: [
                        Text(
                          "Temps estimé en transport :",
                          style:
                              getSemiBoldStyle(fontSize: 11.sp, subTitle: true),
                        ),
                        SizedBox(width: 3.w),
                        dropDownMinutes(
                            controller.estimatedTimeDropOffTransport.value,
                            controller.updateEstimatedTimeDropOffTransport),
                      ],
                    ),
                  ),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Pouvez-vous récupérer l’article ?",
                      style: getSemiBoldStyle(fontSize: 10.sp, subTitle: true),
                    ),
                    value: controller.collectOption.value,
                    onChanged: controller.updateCollectOption,
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  ),
                  Visibility(
                    visible: controller.collectOption.isTrue,
                    child: Row(
                      children: [
                        Text(
                          "Temps estimé à pieds :",
                          style:
                              getSemiBoldStyle(fontSize: 11.sp, subTitle: true),
                        ),
                        SizedBox(width: 3.w),
                        dropDownMinutes(
                            controller.estimatedTimeCollectFeet.value,
                            controller.updateEstimatedTimeCollectFeet),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: controller.collectOption.isTrue,
                    child: Row(
                      children: [
                        Text(
                          "Temps estimé en transport :",
                          style:
                              getSemiBoldStyle(fontSize: 11.sp, subTitle: true),
                        ),
                        SizedBox(width: 3.w),
                        dropDownMinutes(
                            controller.estimatedTimeCollectTransport.value,
                            controller.updateEstimatedTimeCollectTransport),
                      ],
                    ),
                  ),
                  SizedBox(height: 3.h),
                  animatedButton(
                      title: "Ajouter",
                      onTap: controller.newPackage,
                      controller: controller.btnController),
                  SizedBox(height: 30.h),
                ],
              ).paddingSymmetric(horizontal: 4.w),
            ),
          ),
        ),
      ),
    );
  }
}
