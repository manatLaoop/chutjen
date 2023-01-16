// ignore_for_file: unused_local_variable, prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, non_constant_identifier_names, unused_field

import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

// ignore: non_constant_identifier_names

class ImagePikets extends StatefulWidget {
  final Function(File imageFile) callback;

  const ImagePikets(this.callback);

  @override
  State<ImagePikets> createState() => _ImagePiketState();
}

class _ImagePiketState extends State<ImagePikets> {
  File? _imageBg;
  final String imageNull =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: BackgroundImage(),
          ),
          ElevatedButton.icon(
              onPressed: () {
                // Imageupload(callback, ImageSource.camera);
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                            ImagePiket(ImageSource.camera);
                          },
                          leading: FaIcon(FontAwesomeIcons.camera),
                          title: Text('กล้องถ่ายรูป'),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                            ImagePiket(ImageSource.gallery);
                          },
                          leading: Icon(Icons.image_outlined),
                          title: Text('คลั่งรูปภาพ'),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: FaIcon(FontAwesomeIcons.fileImage),
              label: Text('โปรไฟล์')),
        ],
      ),
    );
  }

  Future<void> ImagePiket(ImageSource? imageSource) async {
    final ImagePicker _picker = ImagePicker();
    var imageresult = await _picker.pickImage(
      source: imageSource!,
      imageQuality: 70,
    );

    if (imageresult != null) {
      ImageCropper().cropImage(
        sourcePath: imageresult.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'ลากเพื่อเลือกตำแหน่งรูป',
              toolbarColor: Colors.lightGreen,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
          WebUiSettings(
            context: context,
          ),
        ],
      ).then((imagevalue) {
        if (imagevalue != null) {
          setState(() {
            _imageBg = File(imagevalue.path);
            widget.callback(_imageBg!);
          });
        } else {
          _imageBg = null;
        }
      });
    } else {
      return;
    }
  }

  image_clop(imageresult) {}

  BackgroundImage() {
    if (_imageBg != null) {
      return FileImage(_imageBg!);
    } else {
      return NetworkImage('$imageNull');
    }
  }
}
