import 'package:dio/dio.dart';

class SetPasswordService {
  static Future POST(
      String phonNum, String smsCode, String password, String name) async {
    const api = 'api.bozorbek.uz/customer/set_password/';
    final data = {
      'phone_num': phonNum,
      'sms_code': smsCode,
      'password': password,
      'first_name': name
    };
    final dio = Dio();
    Response response;

    response = await dio.post(api, data: data);
    if (response.statusCode == 201) {
      return response;
    } else {
      return null;
    }
  }
}
