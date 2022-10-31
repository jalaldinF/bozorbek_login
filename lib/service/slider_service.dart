import 'dart:convert';

import 'package:bozorbek_login/model/all_products_model.dart';
import 'package:bozorbek_login/model/slider_model.dart';
import 'package:bozorbek_login/service/base_model.dart';
import 'package:dio/dio.dart';

class SliderSrevice {
  String _url =
      'https://api.bozorbek.uz/products/random_products/?limit=1&offset=1';

  Future<List<Result>?> get() async {
    try {
      Response response =
          await Dio().get("https://api.bozorbek.uz/sliders/?limit=5&offset=0");
      var ress = response.data;
      print('APidan kelgan datalar $ress');
      SliderModel sliderData = SliderModel.fromJson(response.data);
      var ressss = sliderData.results;
      print(sliderData.results);

      return sliderData.results;
    } catch (e) {
      print('catchdagi error $e');
      //   throw Exception("Exeption boldi sabab =>$e");
    }
  }
}
