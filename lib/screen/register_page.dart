import 'package:bozorbek_login/core/constants/string_const.dart';
import 'package:bozorbek_login/widget/register_container.dart';
import 'package:bozorbek_login/widget/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                RegisterContainer(
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
