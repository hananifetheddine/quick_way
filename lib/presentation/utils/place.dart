(String, String) detailsAddress(String address) {
  List<String> split = address.split(", ");
  String name = split.length > 1 ? split[1] : "";
  String formattedAddress = "";

  if (split.isNotEmpty) {
    formattedAddress = split[0];
    if (split.length > 2) {
      formattedAddress += ", ${split.skip(2).join(", ")}";
    }
  }
  return (name, formattedAddress);
}
