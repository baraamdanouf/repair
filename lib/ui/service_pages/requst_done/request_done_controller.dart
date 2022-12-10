import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DoneRequestController extends GetxController {
  final GlobalKey<ScaffoldState> doneRequestKey = GlobalKey<ScaffoldState>();
  final TextEditingController problemController = TextEditingController();

  File? image;
  RxList<String> images = RxList<String>([]);
  final imagePicker = ImagePicker();
  var isPicPathSet = false.obs;
  var picPath = "".obs;

  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onClose() {
    problemController.dispose();
    super.onClose();
  }

  void setProfilePath(String path) {
    picPath.value = path;
    Get.back();
  }

  Future<void> takePhoto(ImageSource source) async {
    try {

      final pickedImage = await imagePicker.pickImage(source: source, imageQuality: 100);
      if (pickedImage == null) return;
      image = File(pickedImage.path);
      setProfilePath(image!.path);
      images.add(picPath.value);
      print("Danouffff");

      print("Doneeee");
      update();
      print("success");
      print(images);

    } on PlatformException catch (e) {
      print("Field to pick image :$e");
    }
  }
}