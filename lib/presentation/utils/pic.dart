import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

Future<String> takePic({double? ratioX, double? ratioY}) async {
  CroppedFile? croppedFileImage;
  var image = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (image != null) {
    croppedFileImage = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatio: ratioX == null || ratioY == null
          ? null
          : CropAspectRatio(ratioX: ratioX, ratioY: ratioY),
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
    );
    return croppedFileImage!.path;
  }
  return "";
}

Future<List<String>> takeMultiPic() async {
  var images = await ImagePicker().pickMultiImage();
  if (images.isNotEmpty) {
    List<String> paths = [];
    for (var item in images) {
      paths.add(item.path);
    }
    return paths;
  }
  return [];
}
