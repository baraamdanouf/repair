import 'package:get/get.dart';
import 'package:repair_app/utils/languages/ar.dart';
import 'package:repair_app/utils/languages/en.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {
        'en' : en,
        'ar':ar
      };
}
