import 'package:bozorbek_login/core/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllProductsContainer extends StatefulWidget {
  const AllProductsContainer({super.key});

  @override
  State<AllProductsContainer> createState() => _AllProductsContainerState();
}

class _AllProductsContainerState extends State<AllProductsContainer> {
  List<Product> products = [
    Product(
        name: 'Броколи',
        catalog: 'Органик продукт',
        price: '50.999 Сум',
        image: 'assets/images/blogly.png',
        color: const Color(0xffE0EBC3)),
    Product(
        name: 'Рис',
        catalog: 'Органик продукт',
        price: '20.999 Сум',
        image: 'assets/images/egg.png',
        color: const Color(0xffFFE2BC)),
    Product(
        name: 'Яйца',
        catalog: 'Органик продукт',
        price: '18.999 Сум',
        image: 'assets/images/rise.png',
        color: const Color(0xffE3D5C7)),
    Product(
        name: 'Персик',
        catalog: 'Органик продукт',
        price: '24.999 Сум',
        image: 'assets/images/peach.png',
        color: const Color(0xffFFC599))
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 5.w),
      height: 250.h,
      // color: Colors.red,
      child: Center(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: products.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index < products.length) {
              return allProducts(index);
            } else {
              return showAllButton();
            }
          },
        ),
      ),
    );
  }

  Widget showAllButton() {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: 60.h,
      width: 60.w,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        MaterialButton(
          onPressed: () {},
          color: Colors.grey,
          padding: const EdgeInsets.all(5),
          shape: const CircleBorder(),
          child: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 55,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'Показать все',
          style: TextStyle(fontSize: 9.sp),
        )
      ]),
    );
  }

  Widget allProducts(int index) {
    return SizedBox(
      // color: Colors.blue,
      height: 240.h,
      width: 140.w,
      child: Stack(alignment: Alignment.centerLeft, children: [
        Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: products[index].color,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
              color: products[index].color,
              borderRadius: BorderRadius.circular(15.r)),
          height: 225.h,
          width: 125.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                ' ${products[index].name}',
                style: TextStyle(fontSize: 18.sp, color: Colors.white),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                '  ${products[index].catalog}',
                style: TextStyle(fontSize: 8.sp, color: Colors.grey),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(' ${products[index].price}',
                  style: TextStyle(fontSize: 15.sp, color: Colors.black))
            ],
          ),
        ),
        Positioned(
          top: 90.h,
          left: 38.w,
          height: 100.h,
          width: 100.w,
          child: Image.asset(
            products[index].image,
            height: 100.h,
            width: 100.w,
          ),
        ),
        Positioned(
            top: 190.h,
            left: 65.w,
            height: 10.h,
            width: 50.w,
            child: ClipOval(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(55.r),
                  color: const Color.fromARGB(30, 82, 72, 54),
                ),
                height: 10.h,
                width: 80.w,
              ),
            )),
      ]),
    );
  }
}
