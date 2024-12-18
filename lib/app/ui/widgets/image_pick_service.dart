import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/helpers/exporter.dart';
import 'custom_text.dart';

class ImagePickService {
  final ImagePicker picker = ImagePicker();

  Future<String?> pickImage({required ImageSource source}) async {
    String path = "";
    if (source == ImageSource.camera && Platform.isAndroid) {
      await checkCameraPermission().then(
        (v) {
          path = v ?? "";
        },
      );
    } else {
      final picker = ImagePicker();
      try {
        final pickedImage = await picker.pickImage(source: source);

        if (pickedImage?.path != null) {
          path = pickedImage?.path ?? "";
        }
      } on PlatformException catch (e) {
        if (e.code == 'camera_access_denied') {
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            SnackBar(
              content: AppText(
                "AppStrings.errorCameraPermission",
                style: Get.context?.textTheme.bodySmall,
              ),
              action: const SnackBarAction(
                label: "AppStrings.settings",
                onPressed: openAppSettings,
                textColor: AppColors.primaryColor,
              ),
            ),
          );
        } else if (e.code == 'photo_access_denied') {
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            SnackBar(
              content: AppText(
                "AppStrings.errorGalleryPermission",
                style: Get.context?.textTheme.bodySmall,
              ),
              action: const SnackBarAction(
                label: "AppStrings.settings",
                onPressed: openAppSettings,
                textColor: AppColors.primaryColor,
              ),
            ),
          );
        }
      }
    }
    return path;
  }

  Future<String> checkCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isGranted) {
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(source: ImageSource.camera);
      if (pickedImage != null) return pickedImage.path;
    } else if (status.isDenied) {
      var result = await Permission.camera.request();
      if (result.isGranted) {
        final picker = ImagePicker();
        final pickedImage = await picker.pickImage(source: ImageSource.camera);
        if (pickedImage != null) return pickedImage.path;
      }
    } else if (status.isPermanentlyDenied) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: AppText(
            "AppStrings.errorGalleryPermission",
            style: Get.context?.textTheme.bodySmall,
          ),
          action: const SnackBarAction(
            label: "AppStrings.settings",
            onPressed: openAppSettings,
            textColor: AppColors.primaryColor,
          ),
        ),
      );
    }
    return "";
  }
}
