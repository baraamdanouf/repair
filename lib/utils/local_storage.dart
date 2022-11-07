import 'package:get_storage/get_storage.dart';

class LocalStorage {
  //write
 static   savedLanguageToDisk(String? language) async {
    await GetStorage().write('lang', language);
  }

  //read
 static String get languageSelected  {
    return  GetStorage().read('lang') ?? "ar";
  }
}
