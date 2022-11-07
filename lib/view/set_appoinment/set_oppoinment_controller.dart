import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController {
  final GlobalKey<ScaffoldState> appointmentKey = GlobalKey<ScaffoldState>();

  var selectedService = 0.obs;

  void onChangeService(var service) {
    selectedService.value = service;
  }

  var selectedPayment = 0.obs;

  void onChangePayment(var payment) {
    selectedPayment.value = payment;
  }

}