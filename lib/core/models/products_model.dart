import 'package:flutter/painting.dart';

class Product {
  String name, catalog, price, image;
  Color color;

  Product(
      {required this.name,
      required this.catalog,
      required this.price,
      required this.image,
      required this.color});
}
