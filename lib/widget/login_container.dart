import 'package:bozorbek_login/core/constants/color_const.dart';
import 'package:bozorbek_login/core/constants/string_const.dart';
import 'package:bozorbek_login/screen/login_cubit/login_cubit.dart';
import 'package:bozorbek_login/screen/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginContainer extends StatefulWidget {
  final String image;
  final String login;

  const LoginContainer({super.key, required this.image, required this.login});

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  @override
  // TODO: implement context
  BuildContext get context => super.context;

  void notPassword() {
    context.watch<LoginCubit>().error = true;
  }

  void Password() {
    context.watch<LoginCubit>().error = false;
  }

  @override
  Widget build(BuildContext context) {
    var readCubit = context.read<LoginCubit>();
    var watchCubit = context.watch<LoginCubit>();
    return Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            color: ColorConst.white,
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        height: 589.sp,
        width: 334.sp,
        child: Column(children: [
          SizedBox(
            height: 73.sp,
          ),
        
          // Circle Picture
          CircleAvatar(
            backgroundColor: ColorConst.greenish,
            radius: 35.0,
            child: Image.asset(
              widget.image,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 23.sp,
          ),
          Text(
            widget.login,
            style: TextStyle(fontSize: 25.sp),
          ),
        
          SizedBox(height: 40.sp),
        
          //Text Field 1
        
          Container(
            //  color: Colors.red,
            padding: EdgeInsets.only(
                top: 12.sp, bottom: 10.sp, right: 15.sp, left: 15.sp),
            height: 75.sp,
            child: TextField(
              textInputAction: TextInputAction.next,
              controller: watchCubit.login_contrl,
              inputFormatters: [
                readCubit.maskFormatter,
                LengthLimitingTextInputFormatter(12),
              ],
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                // hintText: '+998 _ _  _ _ _  _ _  _ _',
                labelText: StringConst.login,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                fillColor: ColorConst.grey,
                prefixText: '+998 ',
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                focusedBorder: context.read<LoginCubit>().myfocusborderL(),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                    borderSide: BorderSide.none),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        
          //Text Field 2
        
          Container(
            //  color: Colors.green,
            //  alignment: Alignment.center,
            padding: EdgeInsets.only(
                top: 4.sp, bottom: 3.sp, right: 15.sp, left: 15.sp),
            height: 80.sp,
            child: Stack(
              alignment: Alignment.center,
              children: [
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: watchCubit.password_controller,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: watchCubit.obscured,
                  focusNode: readCubit.textFieldFocusNode,
                  decoration: InputDecoration(
                    focusedBorder: watchCubit.error
                        ? readCubit.myfocusborder()
                        : readCubit.myfocusborderr(),
                    enabledBorder: watchCubit.error
                        ? readCubit.myfocusborder()
                        : readCubit.myfocusborderr(),
                    floatingLabelBehavior: FloatingLabelBehavior
                        .never, //Hides label on focus or if filled
                    labelText: "Пароль",
                    //  prefixText: '+998 ',
                    filled: true, // Needed for adding a fill color
                    fillColor: watchCubit.error
                        ? ColorConst.error_red
                        : const Color(0xffEEF3F9),
                    isDense: true, // Reduces height a bit
                    border: OutlineInputBorder(
                      borderSide: watchCubit.error
                          ? const BorderSide(color: Colors.green, width: 2.0)
                          : BorderSide.none, // No border
                      borderRadius:
                          BorderRadius.circular(12), // Apply corner radius
                    ),
                    prefixIcon: const Icon(
                      Icons.lock_rounded,
                      size: 20,
                      color: Colors.grey,
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: GestureDetector(
                        onTap: readCubit.toggleObscured,
                        child: Icon(
                          watchCubit.obscured
                              ? Icons.visibility_off_rounded
                              : Icons.visibility,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 75, bottom: 55),
                  child: Text(
                    watchCubit.error ? 'Не правильный логин или пароль' : '',
                    style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 11),
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 5,
          // ),
        
          Wrap(
            children: [
              const Text(
                'У вас нет аккаунта. ',
                style: TextStyle(
                    color: Colors.grey, decoration: TextDecoration.underline),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage()));
                },
                child: const Text(
                  'Зарегистрироваться',
                  style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        
          const Text(
            'Забыли пароль?                                           ',
            style: TextStyle(
                color: Colors.red, decoration: TextDecoration.underline),
          ),
          SizedBox(
            height: 43.h,
          ),
          SizedBox(
            height: 34.sp,
            width: 93.sp,
            child: ElevatedButton(
              onPressed: () async {
                if (watchCubit.password_controller.text.length < 6 ||
                    watchCubit.login_contrl.text.length < 12) {
                  setState(() {
                    notPassword();
                  });
                } else {
                  var login =
                      '+998${readCubit.maskFormatter.getUnmaskedText()}';
                  var password = watchCubit.password_controller.text;
                  context.read<LoginCubit>().loginPost(
                      context: context, phoneNumber: login, password: password);
                }
              },
              style: ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor: const Color(0xff70ADEE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // <-- Radius
                ),
              ),
              child: const Text(
                'Войти',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ]));
  }
}
