import 'package:dio/dio.dart';

class VerifyService {
  // static Future POST(String phonNum, String smsCode) async {
  //   const api = 'https://api.bozorbek.uz/customer/verify/';
  //   final data = {'phone_num': phonNum, 'sms_code': smsCode};
  //   final dio = Dio();
  //   Response response;
  //   response = await dio.post(api, data: data);
  //   if (response.statusCode == 200) {
  //     return response;
  //   } else {
  //     return null;
  //   }
  // }

  static Future post(String phoneNum, String smsCode) async {
    try {
      Response res = await Dio().post(
        "https://api.bozorbek.uz/customer/verify/",
        data: {"phone_num": phoneNum, "sms_code": smsCode},
      );
      print("Apidan kelayotgan malumot: ${res.data}");
      return res.data;
    } catch (e) {
      print("Apidan kelayotgan xato $e");
    }
  }
}
