import 'package:bozorbek_login/core/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesContainer extends StatefulWidget {
  const CategoriesContainer({super.key});

  @override
  State<CategoriesContainer> createState() => _CategoriesContainerState();
}

class _CategoriesContainerState extends State<CategoriesContainer> {
  List<Product> products = [
    Product(
        name: 'Броколи',
        catalog: 'Специи',
        price: '50.999 Сум',
        image: 'assets/images/img77.jpg',
        color: const Color(0xffE0EBC3)),
    Product(
        name: 'Рис',
        catalog: 'Масла',
        price: '20.999 Сум',
        image: 'assets/images/img88.jpg',
        color: const Color(0xffFFE2BC)),
    Product(
        name: 'Яйца',
        catalog: 'Пекареня',
        price: '18.999 Сум',
        image: 'assets/images/img11.jpg',
        color: const Color(0xffE3D5C7)),
    Product(
        name: 'Персик',
        catalog: 'Рыбные',
        price: '24.999 Сум',
        image: 'assets/images/img6.jpg',
        color: const Color(0xffFFC599)),
    Product(
        name: 'Броколи',
        catalog: 'Фрукты',
        price: '50.999 Сум',
        image: 'assets/images/img9.jpg',
        color: const Color(0xffE0EBC3)),
    Product(
        name: 'Рис',
        catalog: 'Молоко',
        price: '20.999 Сум',
        image: 'assets/images/img88.jpg',
        color: const Color(0xffFFE2BC)),
    Product(
        name: 'Яйца',
        catalog: 'Овощи',
        price: '18.999 Сум',
        image: 'assets/images/img11.jpg',
        color: const Color(0xffE3D5C7)),
    Product(
        name: 'Персик',
        catalog: 'Сладостит',
        price: '24.999 Сум',
        image: 'assets/images/img9.jpg',
        color: const Color(0xffFFC599))
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return categoryGridView(index);
        },
      ),
    );
  }

  Widget categoryGridView(int index) {
    return Container(
      height: 150.h,
      width: 155.w,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage(products[index].image), fit: BoxFit.cover)),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(begin: Alignment.topRight, colors: [
              Colors.black.withOpacity(.7),
              Colors.black.withOpacity(.1),
            ])),
        child: Stack(children: [
          Text(
            products[index].catalog,
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
          const Positioned(
              left: 125,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 15,
              ))
        ]),
      ),
    );
  }
}
