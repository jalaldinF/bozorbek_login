import 'package:bozorbek_login/core/constants/string_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopBarContainer extends StatelessWidget {
  final String page;
  const TopBarContainer({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 93.h,
      width: 375.w,
      //padding:
      //  EdgeInsets.only(top: 59.h, right: 353.w, bottom: 20.h, left: 15.w),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 59.h, bottom: 20.h, left: 15.w),
            child: InkWell(
              onTap: () async {
                // if (isLogin) {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const RegisterPage()));
                // }
                //print("object");
              },
              child: const Icon(
                Icons.arrow_back_ios,
                size: 20,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 15.h,
            ),
            child: Text(
              identivyPage(page),

              //StringConst.login : StringConst.register,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }

  String identivyPage(String page) {
    switch (page) {
      case 'login':
        return StringConst.login;
      case 'register':
        return StringConst.register;
      case 'registerF':
        return StringConst.register;
      case 'mainP':
        return StringConst.mainPage;
      case 'catalog':
        return StringConst.catalog;
      case 'kProducts':
        return StringConst.kProducts;
      case 'kInfo':
        return StringConst.kInfo;
      default:
        return 'unknown Page';
    }
  }
}
