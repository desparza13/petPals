import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

enum ImageSection {
  noStoragePermission,
  noStoragePermissionPermanent,
  browseFiles,
  imageLoaded,
}

class GalleryProvider extends ChangeNotifier{
  ImageSection _imageSection = ImageSection.browseFiles;

  ImageSection get imageSection => _imageSection;

  set imageSection(ImageSection value){
    if(value != _imageSection){
      _imageSection = value;
      notifyListeners();
    }
  }

  File? file;

  Future<bool> requestPermission() async {
    PermissionStatus result;

    if(Platform.isAndroid){
      result = await Permission.storage.request();
    }else{
      result = await Permission.photos.request();
    }
    print(result);
    if(result.isGranted){
      imageSection = ImageSection.browseFiles;
      return true;
    }else if(Platform.isIOS || result.isPermanentlyDenied){
      imageSection = ImageSection.noStoragePermissionPermanent;
    }else{
      imageSection = ImageSection.noStoragePermission;
    }

    return false;
  }

  Future<void> pickFile() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
      maxHeight: 720,
      maxWidth: 720,
    );

    if (pickedImage != null) {
      // change the path to store in a different directory
      file = File(pickedImage.path!);
      imageSection = ImageSection.imageLoaded;
    } 
  }
}