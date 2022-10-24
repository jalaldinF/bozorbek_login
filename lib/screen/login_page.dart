import 'package:bozorbek_login/core/constants/string_const.dart';
import 'package:bozorbek_login/widget/login_container.dart';
import 'package:bozorbek_login/widget/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          child: Column(
            children: [
              // Top bar
              const TopBarContainer(
                isLogin: true,
              ),

              SizedBox(
                height: 19.h,
              ),

              //Login Container
              LoginContainer(
                  image: 'assets/images/user.png', login: StringConst.login),
            ],
          ),
        ),
      ),
    );
  }
}
