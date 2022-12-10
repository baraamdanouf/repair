import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NotMaintainedController extends GetxController {
  final GlobalKey<ScaffoldState> notMaintainedKey = GlobalKey<ScaffoldState>();

  final TextEditingController descriptionController = TextEditingController();


  var selectedReason = 0.obs;
  File? image;
  RxList<String> images = RxList<String>([]);
  final imagePicker = ImagePicker();
  var isPicPathSet = false.obs;
  var picPath = "".obs;

  void onChangeReason(var service) {
    selectedReason.value = service;
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