class AppConstants {
  static const int splashDelay = 2;
  static const int sliderAnimationTime = 300;

  static const minNameLength = 3;
  static const maxNameLength = 20;

  static DateTime firstDate = DateTime(1965);
  static DateTime lastDate =
      DateTime.now().subtract(const Duration(days: 6570));
  static DateTime initialDate =
      DateTime.now().subtract(const Duration(days: 6570));
}
