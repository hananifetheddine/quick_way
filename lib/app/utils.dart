String nameFile(String path) {
  return "${DateTime.now()}.${path.split('.').last}";
}
