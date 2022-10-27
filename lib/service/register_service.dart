import 'package:dio/dio.dart';

class RegisterService {
  // static Future POST(String phonNum) async {
  //   const api = 'api.bozorbek.uz/customer/register/';
  //   final data = {'phone_num': phonNum};
  //   final dio = Dio();
  //   Response response;
  //   response = await dio.post(api, data: data);
  //   if (response.statusCode == 200) {
  //     return response.statusCode;
  //   } else {
  //     return null;
  //   }
  // }


   static Future post(String phoneNum,) async {
    try {
      Response res = await Dio().post(
        "https://api.bozorbek.uz/customer/register/",
        data: {
          'phone_num': phoneNum,
         
        },
      );
      print("Apidan kelayotgan malumot: ${res.data}");
      return res.data;
    } catch (e) {
      print("Apidan kelayotgan xato $e");
    }
  }
}
