import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowContainer extends StatefulWidget {
  const RowContainer({super.key});

  @override
  State<RowContainer> createState() => _RowContainerState();
}

class _RowContainerState extends State<RowContainer> {
  List images = [
    'assets/images/img9.jpg',
    'assets/images/img6.jpg',
    'assets/images/img11.jpg',
    'assets/images/img77.jpg',
    'assets/images/img88.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      //  color: Colors.white,
      margin: EdgeInsets.all(3.r),
      padding: EdgeInsets.only(top: 7.h, bottom: 7.h),
      height: 150.h,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          autoPlay: true,
          //autoPlayInterval: const Duration(minutes: 1),
          autoPlayCurve: Curves.linear,
          autoPlayAnimationDuration: const Duration(seconds: 10),
        ),
        itemCount: images.length,
        itemBuilder: ((context, index, realIndex) =>
            scrollingImages(index, realIndex)),
      ),
    );
  }

  Widget scrollingImages(int index, int realIndex) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
        image: DecorationImage(
            image: AssetImage(images[index]), fit: BoxFit.fitWidth),
        color: Colors.red,
        borderRadius: BorderRadius.circular(11.r),
      ),
      height: 140.h,
      width: 240.h,
    );
  }
}
