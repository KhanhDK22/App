import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

extension ContextEx on BuildContext {
  void showSnackBar({required String content, required bool isSuccess}) {
    final snackBar = SnackBar(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
      behavior: SnackBarBehavior.floating,
      backgroundColor: isSuccess == true ? Colors.green : Colors.red,
      content: Center(
        child: Text(
          content,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  Future<FilePickerResult?> pickFile({
    List<String>? allowExtension,
    FileType? fileType,
    bool? multiFile,
  }) async {
    var result = await FilePicker.platform.pickFiles(
      allowedExtensions: allowExtension,
      type: fileType ?? FileType.image,
      allowMultiple: multiFile ?? false,
    );
    return result;
  }

  Future<T> showBottomSheet<T>({required Widget child}) async {
    final result = await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      context: this,
      builder: (ctx) => child,
    );
    return result;
  }
}
