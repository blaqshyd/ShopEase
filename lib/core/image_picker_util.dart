import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  static final ImagePicker _picker = ImagePicker();
  //
  static Future<List<File>> pickImages() async {
    List<File> images = [];

    final imageFiles = await _picker.pickMultiImage();
    if (imageFiles.isNotEmpty) {
      for (final image in imageFiles) {
        images.add(File(image.path));
      }
    }
    return images;
  }

  // static Future<File> pickImage() async {
  //   _picker.pickImage(source: ImageSource.gallery);
  //   return File(ima);
  // }
}
