import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController {
  final GlobalKey<ScaffoldState> appointmentKey = GlobalKey<ScaffoldState>();

  var selectedService = 0.obs;
 // late final controllerS;

  void onChangeService(var service) {
    selectedService.value = service;
  }
  var selectedPayment = 0.obs;
  void onChangePayment(var payment) {
    selectedPayment.value = payment;
  }

  @override
  void onInit() {
    //controllerS = Get.put(ServiceRequestController());
    //Get.delete<ServiceRequestController>();
  //  Get.put(ServiceRequestController());
    print("nvjngjnfgj");
    super.onInit();
  }
  @override
  void dispose() {
    super.dispose();
  }
}