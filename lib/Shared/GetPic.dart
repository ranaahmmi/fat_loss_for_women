import 'dart:io';

import 'package:fat_loss_for_women/Style/Colors.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetProfilePic {
  late File img;
  final _picker = ImagePicker();

  getFromGallery() async {
    // ignore: deprecated_member_use
    final pickedFile = await _picker.getImage(
      source: ImageSource.gallery,
    );
    await _cropImage(pickedFile!.path);
    return img;
  }

  /// Crop Image
  _cropImage(filePath) async {
    File? croppedImage = await ImageCropper.cropImage(
        sourcePath: filePath,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
              ]
            : [
                CropAspectRatioPreset.square,
              ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: AppColors.primaryColor,
            toolbarWidgetColor: AppColors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
    if (croppedImage != null) {
      final path = await getApplicationDocumentsDirectory();
      String finalpath = path.path;
      final File newImage =
          await croppedImage.copy('$finalpath/${DateTime.now()}.png');
      // Step 1: Save image/file path as string either db or shared pref
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('profile', newImage.path);
      img = croppedImage;
    }
  }
}
