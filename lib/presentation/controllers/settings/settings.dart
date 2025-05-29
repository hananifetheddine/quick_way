import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../app/local.dart';
import '../../../data/network/paths.dart';
import '../../../domain/entities/User/profile.dart';
import '../../../domain/use_case/auth/log_out_usecase.dart';
import '../../../main.dart';
import '../../components/dialog_box/log_out.dart';
import '../../resources/routes_manager.dart';
import '../mixin/settings/log_out.dart';

class SettingsController extends GetxController with LogOutMixin {
  SettingsController(this._logOutUseCase);

  final LogOutUseCase _logOutUseCase;

  Profile profile = LocalService.profile;

  @override
  onInit() {
    super.onInit();
    logger.i(profile);
  }

  final WebViewController termsWebController = WebViewController()
    ..loadRequest(Uri.parse(AppPaths.privacyPolicy))
    ..setNavigationDelegate(NavigationDelegate());

  //final LogOutUseCase _logOutUseCase;

  // void updateProfile() {
  //   profile = LocalController.profile;
  //   update(["user"]);
  // }

  showLogOut() {
    showDialogLogOut();
  }

  /*
  Future<void> privacyPolicy() async {
    String url = "https://wassla-delivery.com/wassla-courier/privacy-policy";
    if (await canLaunchUrl(Uri.parse(url))) {
      await canLaunchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
  */

  void singOut() async => await logOut(_logOutUseCase);

  void forceLogOut() async {
    await Get.deleteAll();
    Get.offAllNamed(Routes.welcomeRoute);
  }
}
