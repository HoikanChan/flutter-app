import 'package:dio/dio.dart';

// 或者通过传递一个 `BaseOptions`来创建dio实例

class APIProvider {
  static const String TAG = 'API';
  static const String _baseUrl = "https://saas.tuotuoltd.com/api/";

  Dio _dio;

  APIProvider() {
    BaseOptions dioOptions = BaseOptions()..baseUrl = APIProvider._baseUrl;
    _dio = Dio(dioOptions);
  }

  Future login(String phoneNumber, String verificationCode) async {
    print(phoneNumber);
    print(verificationCode);
    FormData formData = new FormData.from(
        {"phoneNumber": phoneNumber, "verificationCode": verificationCode});
    print(formData);
    Response response = await _dio.post("user/login", data: formData);
    return response;
  }

  Future sendLoginCode(String phoneNumber) async {
    Response response = await _dio.post("user/send-login-mobile-code",
        data: new FormData.from({"phoneNumber": phoneNumber}));
    return response;
  }
}

final APIProvider api = new APIProvider();
