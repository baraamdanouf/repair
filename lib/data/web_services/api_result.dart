import 'package:repair_app/data/web_services/failure.dart';

class ApiResult<T>{
  Failure? failure;
  T? data;

  ApiResult(this.failure , this.data);
}