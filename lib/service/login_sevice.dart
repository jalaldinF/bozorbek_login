import 'package:dio/dio.dart';

class LoginService {
  // static Future POST(String phonNum, String password) async {
  //   const api = 'https://api.bozorbek.uz/customer/login/';
  //   phonNum = '+998$phonNum';
  //   final data = {'username': phonNum, 'password': password};
  //   final dio = Dio();
  //   Response response;
  //   try {
  //     response = await dio.post(api, data: data);
  //     print(response.data);
  //     return response.data.toString();
  //   } catch (e) {
  //     print("object");
  //     return e;
  //   }
  // }

  static Future post(String number, String password,) async {
    try {
      Response res = await Dio().post(
        "https://api.bozorbek.uz/customer/login/",
        data: {
          'username': number,
          'password': password,
        },
      );
      print("Apidan kelayotgan malumot: ${res.data}");
      return res.data;
    } catch (e) {
      print("Apidan kelayotgan xato $e");
    }
  }
}
