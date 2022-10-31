import 'dart:convert';

List<AllProductsResponse> welcomeFromJson(String str) =>
    List<AllProductsResponse>.from(
        json.decode(str).map((x) => AllProductsResponse.fromJson(x)));

//String welcomeToJson(List<AllProductsResponse> data) =>
//    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllProductsResponse {
  AllProductsResponse({
    this.name,
    this.getAbsoluteUrl,
    this.slug,
    this.category,
    this.image,
    this.price,
    this.discount,
    this.unit,
    this.backgroundColor,
    this.maxPrice,
  });

  String? name;
  String? getAbsoluteUrl;
  String? slug;
  String? category;
  String? image;
  double? price;
  double? discount;
  String? unit;
  String? backgroundColor;
  double? maxPrice;

  factory AllProductsResponse.fromJson(Map<String, dynamic> json) =>
      AllProductsResponse(
        name: json["name"],
        getAbsoluteUrl: json["get_absolute_url"],
        slug: json["slug"],
        category: json["category"],
        image: json["image"],
        price: json["price"],
        discount: json["discount"],
        unit: json[json["unit"]],
        backgroundColor: json["background_color"],
        maxPrice: json["max_price"],
      );



  List<AllProductsResponse> welcomeFromJson(String str) =>
      List<AllProductsResponse>.from(
          json.decode(str).map((x) => AllProductsResponse.fromJson(x)));
}
