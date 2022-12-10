abstract class ApiStateListener {
  void onSuccess(Object params);

  void onFailure(int code, String? message);

  void onError(String message);
}
