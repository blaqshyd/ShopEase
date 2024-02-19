import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:shop_ease/core/core.dart';

class FileService {
  static Future<File?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null ) {
      File? pickedFile = await result.asFile;
      return pickedFile;
    }
    return null;
  }

  static Future<FilePickerResult?> pickImage() async {
    final image = await FilePicker.platform.pickFiles(type: FileType.image);
    if (image != null) return image;

    return null;
  }

  static Future<FilePickerResult?> pickVideo() async {
    final video = await FilePicker.platform.pickFiles(type: FileType.video);
    if (video != null) return video;
    return null;
  }
}
