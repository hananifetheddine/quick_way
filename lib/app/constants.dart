class Constants {
  //static const String _domainName = "https://quickway.wassla-delivery.com";

  static const String _domainName = "http://192.168.43.61:8094";

  static String imageUrl(String url) => "$_domainName/uploads/$url";

  static const String baseUrl = "$_domainName/api";

  static const String ioUrl = _domainName;

  static const String empty = "";

  static const int zero = 0;

  static const int apiTimeOut = 60000;

  static const String apiKey = "";

  static const String appLink =
      "https://play.google.com/store/apps/details?id=com.wassla.app&hl=fr_CH";
}
