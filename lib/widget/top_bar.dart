import 'package:bozorbek_login/core/constants/string_const.dart';
import 'package:bozorbek_login/screen/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../service/login_sevice.dart';

class TopBarContainer extends StatelessWidget {
  final bool isLogin;
  const TopBarContainer({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 93.h,
      width: 375.w,
      //padding:
      //  EdgeInsets.only(top: 59.h, right: 353.w, bottom: 20.h, left: 15.w),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
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
                print("object");
                
              },
              child: Icon(
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
              isLogin ? StringConst.login : StringConst.register,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
