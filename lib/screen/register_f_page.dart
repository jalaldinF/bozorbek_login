import 'package:bozorbek_login/core/constants/string_const.dart';
import 'package:bozorbek_login/widget/registerF_container.dart';
import 'package:bozorbek_login/widget/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterFPage extends StatefulWidget {
  String phonNum;
  String smsCode;
  String name;
  RegisterFPage(
      {super.key,
      required this.phonNum,
      required this.name,
      required this.smsCode});

  @override
  State<RegisterFPage> createState() => _RegisterFPageState();
}

class _RegisterFPageState extends State<RegisterFPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/rec.png'),
                    fit: BoxFit.cover)),
            child: Center(
              child: Column(
                children: [
                  // Top bar
                  const TopBarContainer( page: 'registerF',),
              
                  SizedBox(
                    height: 19.h,
                  ),
              
                  //Login Container
                  RegisterFContainer(
                    image: 'assets/images/user.png',
                    register: StringConst.register,
                    phonNum: widget.phonNum,
                    smsCode: widget.smsCode,
                    name: widget.name,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
