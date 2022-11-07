import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:get/get.dart';
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

  @override
  void onInit() {
    super.onInit();
    initRecorder();
    setAudio();

    audioPlaying.onPlayerStateChanged.listen((event) {
      isPlaying.value = event == PlayerState.PLAYING;
    });
    audioPlaying.onDurationChanged.listen((newDuration) {
      duration.value = newDuration;
    });
    audioPlaying.onAudioPositionChanged.listen((newPosition) {
      position.value = newPosition;
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioPlaying.stop();
    recorder.value.closeRecorder();
  }

  Future record() async {
    initRecorder();
    if (!isRecorderReady.value) return;
    isDeleted.value = false;
    isRecord.value = true;
    await recorder.value.startRecorder(toFile: 'audio');
  }
  Future initRecorder() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw 'Microphone permission not granted';
    }
    await recorder.value.openRecorder();
    isRecorderReady.value = true;
    recorder.value.setSubscriptionDuration(const Duration(milliseconds: 500));
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
    print("xxxxx : $audioFile");
    audioPlaying.setReleaseMode(ReleaseMode.LOOP);
    audioPlaying.setUrl(audioFile.path, isLocal: true);
  }

  Future deleteAudio() async
  {
    if (!isRecorderReady.value) return;
    path.value = (await recorder.value.stopRecorder())!;
    File audioFile = File(path.value);
    print("xxxxx : $audioFile");
    audioFile = File('');
    audioPlaying.setUrl(audioFile.path, isLocal: true);
    duration.value = Duration.zero;
    position.value = Duration.zero;
   isDeleted.value = false;
   isRecord.value = false;
  }
}
