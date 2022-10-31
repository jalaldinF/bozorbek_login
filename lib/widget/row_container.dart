import 'package:bozorbek_login/model/slider_model.dart';
import 'package:bozorbek_login/service/slider_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowContainer extends StatefulWidget {
  const RowContainer({super.key});

  @override
  State<RowContainer> createState() => _RowContainerState();
}

class _RowContainerState extends State<RowContainer> {
  var imgs;

  @override
  Widget build(BuildContext context) {
    return Container(
      //  color: Colors.white,
      margin: EdgeInsets.all(3.r),
      padding: EdgeInsets.only(top: 7.h, bottom: 7.h),
      height: 150.h,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
        future: SliderSrevice().get(),
        builder: (context, snapshot) {
           imgs = snapshot.data;

            //imgs = [ snapshot.data?[0].image, snapshot.data?[1].image, snapshot.data?[2].image,snapshot.data?[3].image, snapshot.data?[4].image, snapshot.data?[5].image];

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Not Data"),
            );
          } else {
            return CarouselSlider.builder(
              options: CarouselOptions(
                autoPlay: true,
                //autoPlayInterval: const Duration(minutes: 1),
                autoPlayCurve: Curves.linear,
                autoPlayAnimationDuration: const Duration(seconds: 10),
              ),
              itemCount: imgs.length,
              itemBuilder: ((context, index, realIndex) =>
                  scrollingImages(index, realIndex, imgs)),
            );
          }
        },
      ),
    );
  }

  Widget scrollingImages(int index, int realIndex, data) {
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
            image: NetworkImage('https://api.bozorbek.uz${data[index].image}'),
            fit: BoxFit.fitWidth),
        color: Colors.red,
        borderRadius: BorderRadius.circular(11.r),
      ),
      height: 140.h,
      width: 240.h,
    );
  }
}
