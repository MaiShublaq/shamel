import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shamel/api/api_helpers.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> with ApiHelpers {
  double? linearProgressValue = 0;
  XFile? _pickedFile;
  ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Image'),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            backgroundColor: Colors.blue.shade200,
            color: Colors.green,
            minHeight: 10,
            value: linearProgressValue,
          ),
          Expanded(
            child: _pickedFile != null
                ? Image.file(File(_pickedFile!.path))
                : TextButton(
              child: const Text('pick Image'),
              onPressed: () async => pickImage(),
              style: TextButton.styleFrom(
                minimumSize: const Size(double.infinity, 0),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () async => await performUpload(),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 60),
            ),
            icon: const Icon(Icons.cloud_upload),
            label: const Text(
              'UPLOAD',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> pickImage() async {
    XFile? imageFile = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    if (imageFile != null) {
      setState(() {
        _pickedFile = imageFile;
      });
    }
  }

  Future<void> performUpload() async {
    if (checkData()) {
      await uploadImage();
    }
  }

  bool checkData() {
    if (_pickedFile != null) {
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Select image to upload',
      error: true,
    );
    return false;
  }

  uploadImage(){
    Navigator;
  }
  }