import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:quick_way/presentation/resources/theme_manager.dart';
import 'package:sizer/sizer.dart';

const String _imagePath = "assets/images";
const String _iconPath = "assets/icons";
const String _illustrationPath = "assets/illustration";
const String _animationPath = "assets/animations";
const String _logoPath = "assets/logo";
const String _mapPath = "assets/map_style";

class AnimationAssets {
  static const String promoCode = "$_animationPath/promo_code.json";

  static const String congrats = "$_animationPath/congrats.json";
  static const String stars = "$_animationPath/5-stars.json";
  static const String success = "$_animationPath/success.json";
  static const String noServiceFound = "$_animationPath/no_service_found.json";
  static const String noDataAnimation = "$_animationPath/no_data.json";
  static const String noInternetAnimation = "$_animationPath/no_internet.json";
  static const String wentWrongAnimation = "$_animationPath/went_wrong.json";
  static const String locationAnimation = "$_animationPath/location.json";
  static const String robotAnimation = "$_animationPath/robot.json";
}

class ImageAssets {
  static String welcome = "$_imagePath/welcome.jpg";

  static const String splashLogo = "$_imagePath/splash_logo.png";
  static const String courier = "$_imagePath/courier.svg";
}

class LogoAssets {
  static const String svgLogo = "$_logoPath/logo.svg";
  static const String splashLogo = "$_logoPath/splash_logo.svg";
  static String logoText =
      ThemeManager.isThemeDark() ? _logoTextDarkMood : _logoTextLightMood;
  static const String _logoTextDarkMood = "$_logoPath/logo_text_white.svg";
  static const String _logoTextLightMood = "$_logoPath/logo_text.svg";
}

class IllustrationAssets {
  static const String phone = "$_illustrationPath/phone.png";
  static const String otp = "$_illustrationPath/otp.png";
  static const String person = "$_illustrationPath/person.png";
}

class IconAssets {
  //new
  static const String boxIcon = "$_iconPath/box.svg";
  static const String bagIcon = "$_iconPath/bag.svg";
  static const String searchIcon = "$_iconPath/search.svg";
  static const String heartIcon = "$_iconPath/heart.svg";
  static const String heartFillIcon = "$_iconPath/heart_fill.svg";
  static const String placeIcon = "$_iconPath/place.svg";
  static const String notificationIcon = "$_iconPath/notification.svg";
  static const String chatIcon = "$_iconPath/chat.svg";

  //old
  static const String personIcon = "$_iconPath/person.svg";
  static const String personBoldIcon = "$_iconPath/person_bold.svg";
  static const String calenderIcon = "$_iconPath/calender.svg";
  static const String emailIcon = "$_iconPath/email.svg";
  static const String peopleIcon = "$_iconPath/people.svg";
  static const String walletIcon = "$_iconPath/wallet.svg";
  static const String copyIcon = "$_iconPath/copy.svg";

  static const String homeIcon = "$_iconPath/home.svg";
  static const String homeBoldIcon = "$_iconPath/home_bold.svg";
  static const String listIcon = "$_iconPath/list.svg";
  static const String listBoldIcon = "$_iconPath/list_bold.svg";
  static const String targetIcon = "$_iconPath/target.svg";
  static const String locationWasslaIcon = "$_iconPath/wassla_place.svg";
  static const String currentLocationIcon = "$_iconPath/current_location.svg";
  static const String locationIcon = "$_iconPath/location.svg";
  static const String flagIcon = "$_iconPath/flag.svg";
  static const String mapIcon = "$_iconPath/map.svg";
  static const String bikeIcon = "$_iconPath/bike.svg";
  static const String motorCycleIcon = "$_iconPath/motorcycle.svg";
  static const String carIcon = "$_iconPath/car.svg";
  static const String lineBottomSheetIcon = "$_iconPath/line.svg";
  static const String manIcon = "$_iconPath/man.svg";
  static const String promoCodeIcon = "$_iconPath/promo_code.svg";
  static const String stepAcceptedIcon = "$_iconPath/step_accepted.svg";
  static const String stepDeliveredIcon = "$_iconPath/step_delivered.svg";
  static const String stepRecoveredIcon = "$_iconPath/step_recovered.svg";
  static const String callIcon = "$_iconPath/call.svg";
  static const String messageIcon = "$_iconPath/message.svg";
  static const String addPicIcon = "$_iconPath/add_pic.svg";

  //settings
  static const String workIcon = "$_iconPath/work.svg";
  static const String reportIcon = "$_iconPath/contact.svg";
  static const String termsConditionsIcon = "$_iconPath/terms_conditions.svg";
  static const String rateUsIcon = "$_iconPath/rate_us.svg";
  static const String logOutIcon = "$_iconPath/log_out.svg";
  static const String arrowDropDownIcon = "$_iconPath/drop_down_arrow.svg";
  static const String contactUsIcon = "$_iconPath/world.svg";
  static const String moreIcon = "$_iconPath/more.svg";
  static const String deleteUser = "$_iconPath/delete_user.svg";
}

class MarkersAssets {
  static const String markerLocationIcon =
      "$_iconPath/wassla_location_user.png";
  static const String markerPackageIcon =
      "$_iconPath/wassla_location_package.png";
  static const String markerCourierIcon =
      "$_iconPath/wassla_location_courier.png";
  static late Uint8List userLocationIcon;
  static late Uint8List packageLocationIcon;
  static late Uint8List courierLocationIcon;

  static Future<void> load() async {
    var res = await Future.wait([
      _getBytesFromAsset(markerLocationIcon, 50.sp.toInt()),
      _getBytesFromAsset(markerPackageIcon, 50.sp.toInt()),
      _getBytesFromAsset(markerCourierIcon, 50.sp.toInt()),
    ]);

    userLocationIcon = res[0];
    packageLocationIcon = res[1];
    courierLocationIcon = res[2];
  }

  static Future<Uint8List> _getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}

class MapStyles {
  static const String _darkMapStyleAsset = "$_mapPath/dark.json";
  static String darkMapStyle = "";

  static load() async {
    darkMapStyle = await rootBundle.loadString(_darkMapStyleAsset);
  }
}
