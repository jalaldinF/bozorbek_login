import 'dart:convert';

import 'package:bozorbek_login/model/all_products_model.dart';
import 'package:bozorbek_login/service/base_model.dart';
import 'package:dio/dio.dart';

class AllProductsService {
  String _url =
      'https://api.bozorbek.uz/products/random_products/?limit=1&offset=1';

  Future <List<AllProductsResponse>?> get() async {
    try {
      Response response = await Dio().get(
          "https://api.bozorbek.uz/products/random_products/?limit=1&offset=1");
      var ress = response.data.toString();
      print('APidan kelgan datalar $ress');
      var somt = (response.data as List).map((e) => AllProductsResponse.fromJson(e)).toList();

      return (response.data as List).map((e) => AllProductsResponse.fromJson(e)).toList();
     
     
      // final Map<String, dynamic> decodedRespond = jsonDecode(response.data);
      // if (decodedRespond['succes']) {
      //   final List<dynamic> data = decodedRespond['data'];
      //   return data
      //       .map((dynamic e) => AllProductsResponse.fromJson(e))
      //       .toList();
      

      // List<AllProductsResponse> res = AllProductsResponse().welcomeFromJson(response.data.toString());
      // print('APidan kelgan Listlar$res');
      // return res;
    } catch (e) {
      print('catchdagi error $e');
      //   throw Exception("Exeption boldi sabab =>$e");
    }
  }

  // static Future GET<T extends BaseModel>(T model) async {
  //   Response res = await Dio().get(
  //       'https://api.bozorbek.uz/products/random_products/?limit=1&offset=1');
  //   switch (res.statusCode) {
  //     case HttpStatus.ok:
  //       var responseBody = res.data;
  //       if (responseBody is List) {
  //         print(responseBody);
  //         var data = responseBody.map((e) => model.fromJson(e)).toList();
  //         return data;
  //       } else if (responseBody is Map) {
  //         return model.fromJson(responseBody);
  //       } else {
  //         return responseBody;
  //       }
  //     case HttpStatus.internalServerError:
  //       return HttpStatus.internalServerError;
  //   }
  // }
}
