// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:rental_app/core/helper/show_snack_bar.dart';

Future<List<File>?> pickAndUploadImages() async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
    );
    if (result == null) {
      showSnackBar(title: "No image selected");
      return null;
    }
    List<File> files = result.paths.map((path) => File(path!)).toList();
    showSnackBar(title: "Image Upload Successfully");
    return files;
  } catch (e) {
    showSnackBar(title: "Unexpected error: Please try again");
    return null;
  }
}
