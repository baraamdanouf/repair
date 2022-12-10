import 'dart:convert';

class OperationResult<T> {
  bool? success;
  T? data;
  String? errorCode;
  String? error;

  OperationResult({
    this.success,
    this.data,
    this.errorCode,
    this.error,
  });

  factory OperationResult.fromJson(Map<String, dynamic> json) =>
      OperationResult(
        success: json["success"],
        data: json["data"],
        errorCode: json["error_code"],
        error: json["error"],
      );
}

OperationResult operationResultFromJson(String str) =>
    OperationResult.fromJson(json.decode(str));
