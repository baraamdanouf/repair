import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static const LANGUAGE = 'language';
  static const TOKEN = 'token';
  static const ROLE = 'role';

  //region write
  static void savedLanguageToDisk(String? language) async {
    await GetStorage().write(LANGUAGE, language);
  }

  void saveToken(String token) async {
    await GetStorage().write(TOKEN, token);
  }

  static void saveRole(int role) async {
    await GetStorage().write(ROLE, role);
  }

  //endregion write

  //region read
  static String get languageSelected {
    return GetStorage().read(LANGUAGE) ?? "ar";
  }

  Future<String> get getTokenFromDisk async {
    return await GetStorage().read(TOKEN) ?? '';
  }

  static int get roleSelected {
    return GetStorage().read(ROLE) ?? 0;
  }

  //endregion read

  //region delete
  void removeTokenFromDisk() async {
    await GetStorage().remove(TOKEN);
  }
//endregion delete
}
