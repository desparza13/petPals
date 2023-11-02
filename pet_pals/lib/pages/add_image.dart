import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pet_pals/providers/gallery_provider.dart';
import 'package:provider/provider.dart';

class AddImage extends StatefulWidget {
  const AddImage({super.key});

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  late final GalleryProvider _model;

  @override
  void initState() {
    super.initState();
    _model = GalleryProvider();
  }

  Future<void> _checkPermissions() async {
    final hasFilePermission = await _model.requestPermission();
    if (hasFilePermission) {
      try {
        await _model.pickFile();
      } catch (e) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                "$e",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _model,
      child: Consumer<GalleryProvider>(builder: (context, model, child) {
        Widget widget;
        switch (model.imageSection) {
          case ImageSection.noStoragePermission:
            widget = imagePermissions(false);
            break;
          case ImageSection.noStoragePermissionPermanent:
            widget = imagePermissions(true);
            break;
          case ImageSection.browseFiles:
            widget = pickFile();
            break;
          case ImageSection.imageLoaded:
            widget = _selectedImage(_model.file!);
            break;
        }
        return Container(
          child: widget,
        );
      }),
    );
  }

  Widget pickFile() {
    var theme = Theme.of(context);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: theme.colorScheme.onPrimary),
        onPressed: () {
          _checkPermissions();
        },
        child: Text('upload image'));
  }

  Widget imagePermissions(bool isPermanent) {
    var theme = Theme.of(context);
    return Container(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: theme.colorScheme.onPrimary),
          onPressed: () {
            isPermanent ? openAppSettings() : _checkPermissions();
          },
          child: Text(isPermanent ? 'Open settings' : 'Allow access')),
    );
  }
}

Widget _selectedImage(File? newSelectedImage) => newSelectedImage == null
    ? Container()
    : Image.file(
        newSelectedImage,
        height: 200,
        fit: BoxFit.fill,
      );
