import 'package:bozorbek_login/core/constants/string_const.dart';
import 'package:bozorbek_login/widget/registerF_container.dart';
import 'package:bozorbek_login/widget/register_container.dart';
import 'package:bozorbek_login/widget/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterFPage extends StatefulWidget {
  const RegisterFPage({super.key});

  @override
  State<RegisterFPage> createState() => _RegisterFPageState();
}

class _RegisterFPageState extends State<RegisterFPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/rec.png'),
                  fit: BoxFit.cover)),
          child: Center(
            child: Column(
              children: [
                // Top bar
                const TopBarContainer(isLogin: false),

                SizedBox(
                  height: 19.h,
                ),

                //Login Container
                RegisterFContainer(
                    image: 'assets/images/user.png',
                    register: StringConst.register),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
