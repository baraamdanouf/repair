import 'package:get/get.dart';


class LoginController extends GetxController{
  RxBool showPassword = true.obs;

//  get getViewCreateAccount => Get.off(const CreateAccountView());

//  get getViewResetPassword => Get.to(const ResetPasswordView());

  @override
  void onInit() {
    super.onInit();

    everAll([showPassword], (_) => {});
  }

}
