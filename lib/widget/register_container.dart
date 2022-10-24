import 'package:bozorbek_login/core/constants/color_const.dart';
import 'package:bozorbek_login/core/constants/string_const.dart';
import 'package:bozorbek_login/screen/register_f_page.dart';
import 'package:bozorbek_login/service/register_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterContainer extends StatefulWidget {
  final String image;
  final String register;
  const RegisterContainer(
      {super.key, required this.image, required this.register});

  @override
  State<RegisterContainer> createState() => _RegisterContainerState();
}

class _RegisterContainerState extends State<RegisterContainer> {
  SnackBar _showScaffold(String message, {Color? color}) {
    return SnackBar(
      duration: const Duration(seconds: 1),
      content: Text(message),
      backgroundColor: color,
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
    );
  }

  var phone_numController = TextEditingController();
  bool isWrongCode = false;
  bool didCodeSent = false;
  var maskFormatter = MaskTextInputFormatter(
      mask: '## ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
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
            widget.register,
            style: const TextStyle(fontSize: 25),
          ),

          SizedBox(height: 40.sp),

          Container(
            padding: EdgeInsets.only(
                top: 5.sp, bottom: 4.sp, right: 15.sp, left: 15.sp),
            height: 60.sp,
            child: TextField(
              textInputAction: TextInputAction.next,
              //  controller: login_contrl,

              decoration: InputDecoration(
                // hintText: '+998 _ _  _ _ _  _ _  _ _',
                labelText: StringConst.name_suren,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                fillColor: ColorConst.grey,

                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                focusedBorder: myfocusborderL(),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide.none),
                border: const OutlineInputBorder(),
              ),
            ),
          ),

          //Text Field 2
          Container(
            padding: EdgeInsets.only(
                top: 5.sp, bottom: 4.sp, right: 15.sp, left: 15.sp),
            height: 60.sp,
            child: TextField(
              controller: phone_numController,
              inputFormatters: [
                maskFormatter,
                LengthLimitingTextInputFormatter(12),
              ],
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                // hintText: '+998 _ _  _ _ _  _ _  _ _',
                labelText: StringConst.ur_phone_num,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                fillColor: ColorConst.grey,
                prefixText: '+998 ',
                prefixIcon: const Icon(
                  Icons.phone,
                  color: Colors.grey,
                ),
                focusedBorder: myfocusborderL(),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide.none),
                border: const OutlineInputBorder(),
              ),
            ),
          ),

          //Text Field 3 Container
          Visibility(
            visible: didCodeSent,
            child: Container(
              //color: Colors.red,
              padding: EdgeInsets.only(
                  top: 5.sp, bottom: 4.sp, right: 15.sp, left: 15.sp),
              height: 60.sp,
              child: Stack(children: [
                //Text Field 3
                TextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(4),
                  ],
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    // hintText: '+998 _ _  _ _ _  _ _  _ _',
                    labelText: isWrongCode ? '' : StringConst.code,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    filled: true,
                    fillColor: ColorConst.grey,

                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Colors.grey,
                    ),
                    focusedBorder: myfocusborderL(),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none),
                    border: const OutlineInputBorder(),
                  ),
                ),
                //error message
                Padding(
                  padding: const EdgeInsets.only(left: 45, top: 19),
                  child: Text(
                    isWrongCode ? 'Ввели не правильный код' : '',
                    style: TextStyle(color: Colors.red, fontSize: 12.sp),
                  ),
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 10.sp,
          ),

          Wrap(
            children: [
              Text(
                // !didCodeSent
                //     ? 'У меня есть аккаунт. '
                //     : 'Отправить заново код.                              '
                didCodeSent && isWrongCode
                    ? 'Введите правильный код.                    '
                    : !didCodeSent
                        ? 'У меня есть аккаунт. '
                        : 'Отправить заново код.',
                style: const TextStyle(
                    color: Colors.grey, decoration: TextDecoration.underline),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  !didCodeSent ? 'Войти                    ' : '',
                  style: const TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          SizedBox(height: 35.sp),
          //Button
          SizedBox(
            height: 35.sp,
            width: 199.sp,
            child: ElevatedButton(
              onPressed: () {
                //   if (password_controller.text.length < 6) {
                //     setState(() {
                //       notPassword();
                //     });
                //   } else
                //     setState(() {
                //       Password();
                //     });

                var data = RegisterService.post(
                    '+998${maskFormatter.getUnmaskedText()}');

                var sms = data.toString().split(" ")[0];
                print(sms);
                bool sms2 = data.toString().split(" ")[0] == "{phone_num";
                print(sms2);
                if (data.toString().split(" ")[0] == "{phone_num") {
                  // ignore: use_build_context_synchronously
                  _showScaffold("Yaxshi Natija");
                } else {
                  // ignore: use_build_context_synchronously

                  _showScaffold("Oxhamadi Brat", color: ColorConst.red);
                }

                if (didCodeSent) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterFPage()),
                  );
                }

                didCodeSent = !didCodeSent;
                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor: const Color(0xff70ADEE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // <-- Radius
                ),
              ),
              child: Text(
                !didCodeSent ? 'Получить код' : 'Продолжить',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          )
        ]));
  }

  OutlineInputBorder myfocusborderL() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide.none);
  }
}
