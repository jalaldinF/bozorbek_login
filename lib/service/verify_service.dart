import 'package:dio/dio.dart';

class VerifyService {
  static Future POST(String phonNum, String smsCode) async {
    const api = 'api.bozorbek.uz/customer/verify/';
    final data = {'phone_num': phonNum, 'sms_code': smsCode};
    final dio = Dio();
    Response response;

    response = await dio.post(api, data: data);
    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }
}
