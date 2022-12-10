import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sound/flutter_sound.dart' hide PlayerState;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ServiceRequestController extends GetxController {
  final GlobalKey<ScaffoldState> serviceRequestKey = GlobalKey<ScaffoldState>();
  final TextEditingController problemController = TextEditingController();
  final recorder = FlutterSoundRecorder().obs;
  final AudioPlayer audioPlaying = AudioPlayer();
  RxBool isPlaying = false.obs;
  RxBool isRecorderReady = false.obs;
  RxBool isDeleted = false.obs;
  RxBool isRecord = false.obs;
  final duration = Duration.zero.obs;
  final position = Duration.zero.obs;
  final path = ''.obs;
  final isLoading = false.obs;
  File? image;
  RxList<String> images = RxList<String>([]);
  final imagePicker = ImagePicker();
  var isPicPathSet = false.obs;
  var picPath = "".obs;

  @override
  void onInit() {
    initRecorder();
    super.onInit();
    setAudio();
    audioPlaying.onPlayerStateChanged.listen((event) {
      isPlaying.value = event == PlayerState.playing;
    });
    audioPlaying.onDurationChanged.listen((newDuration) {
      duration.value = newDuration;
    });
    audioPlaying.onPositionChanged.listen((newPosition) {
      position.value = newPosition;
    });
  }

  @override
  void dispose() {
    super.dispose();
    problemController.dispose();
    recorder.value.closeRecorder();
    path.value = '';
    isRecord.value = false;
    isRecorderReady.value = false;
    audioPlaying.stop();
  }

  Future record() async {
    await initPermission();
    if (!isRecorderReady.value) return;
    isDeleted.value = false;
    isRecord.value = true;
    await recorder.value.startRecorder(
      toFile: 'audio',
      // numChannels: 2,
      // bitRate: 300000,
      // sampleRate: 44100,
    );
  }

  Future initRecorder() async {
    await recorder.value.openRecorder();
    isRecorderReady.value = true;
    recorder.value.setSubscriptionDuration(const Duration(milliseconds: 500));
  }

  Future initPermission() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw 'Microphone permission not granted';
    }
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  Future setAudio() async {
    if (!isRecorderReady.value) return;
    path.value = (await recorder.value.stopRecorder())!;
    File audioFile = File(path.value);
    isDeleted.value = true;
    isRecord.value = false;
    print("audioFile : $audioFile");
    audioPlaying.setReleaseMode(ReleaseMode.stop);
    audioPlaying.setSourceUrl(audioFile.path);
  }

  Future deleteAudio() async {
    if (!isRecorderReady.value) return;
    path.value = (await recorder.value.stopRecorder())!;
    File audioFile = File(path.value);
    print("audioFile : $audioFile");
    audioFile = File('');
    audioPlaying.setSourceUrl(audioFile.path,);
    duration.value = Duration.zero;
    position.value = Duration.zero;
    isDeleted.value = false;
    isRecord.value = false;
  }

  void setProfilePath(String path) {
    picPath.value = path;
    Get.back();
  }

  Future<void> takePhoto(ImageSource source) async {
    try {
      final pickedImage =
      await imagePicker.pickImage(source: source, imageQuality: 100);
      if (pickedImage == null) return;
      image = File(pickedImage.path);
      setProfilePath(image!.path);
      images.add(picPath.value);
      update();
      print("success");
      print(images);
    } on PlatformException catch (e) {
      print("Field to pick image :$e");
    }
  }
}
