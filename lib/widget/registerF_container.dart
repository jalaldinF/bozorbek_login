import 'package:bozorbek_login/core/constants/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterFContainer extends StatefulWidget {
  final String image;
  final String register;
  const RegisterFContainer(
      {super.key, required this.image, required this.register});

  @override
  State<RegisterFContainer> createState() => _RegisterFContainerState();
}

class _RegisterFContainerState extends State<RegisterFContainer> {
  bool isSame = false;
  bool value = false;
  bool _obscured = true;

  bool _obscured2 = true;
  final textFieldFocusNode = FocusNode();
  final textFieldFocusNode2 = FocusNode();
  final password_controller = TextEditingController();

  final password_controller2 = TextEditingController();

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return;
      } // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  void _toggleObscured2() {
    setState(() {
      _obscured2 = !_obscured2;
      if (textFieldFocusNode2.hasPrimaryFocus) {
        return;
      } // If focus is on text field, dont unfocus
      textFieldFocusNode2.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

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

          SizedBox(height: 10.sp),

          Text(
            'Пароль должен содержать включая цифры,\n  буквы и специальные символы (!?@%%).',
            style: TextStyle(fontSize: 13.sp, color: Colors.grey),
          ),

          SizedBox(
            height: 27.sp,
          ),

          // Text Field 1

          Container(
            //  color: Colors.red,
            //  alignment: Alignment.center,
            padding: EdgeInsets.only(
                top: 4.sp, bottom: 3.sp, right: 15.sp, left: 15.sp),
            height: 60.sp,
            child: Stack(
              alignment: Alignment.center,
              children: [
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: password_controller,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscured,
                  focusNode: textFieldFocusNode,
                  decoration: InputDecoration(
                    focusedBorder: isSame ? myfocusborder() : myfocusborderr(),
                    enabledBorder: isSame ? myfocusborder() : myfocusborderr(),
                    floatingLabelBehavior: FloatingLabelBehavior
                        .never, //Hides label on focus or if filled
                    labelText: "Пароль",
                    //  prefixText: '+998 ',
                    filled: true, // Needed for adding a fill color
                    fillColor:
                        isSame ? ColorConst.error_red : const Color(0xffEEF3F9),
                    isDense: true, // Reduces height a bit
                    border: OutlineInputBorder(
                      borderSide: isSame
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
                        onTap: _toggleObscured,
                        child: Icon(
                          _obscured
                              ? Icons.visibility_off_rounded
                              : Icons.visibility,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 100, bottom: 55),
                //   child: Text(
                //     isSame ? 'Не правильный пароль \t\t\t' : '',
                //     style: const TextStyle(
                //         color: Colors.red,
                //         fontWeight: FontWeight.bold,
                //         fontSize: 11),
                //   ),
                // ),
              ],
            ),
          ),

          // Text Field 2

          Container(
            //color: Colors.green,
            //  alignment: Alignment.center,
            padding: EdgeInsets.only(
                top: 4.sp, bottom: 3.sp, right: 15.sp, left: 15.sp),
            height: 60.sp,
            child: Stack(
              alignment: Alignment.center,
              children: [
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: password_controller2,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscured2,
                  focusNode: textFieldFocusNode2,
                  decoration: InputDecoration(
                    focusedBorder: isSame ? myfocusborder() : myfocusborderr(),
                    enabledBorder: isSame ? myfocusborder() : myfocusborderr(),
                    floatingLabelBehavior: FloatingLabelBehavior
                        .never, //Hides label on focus or if filled
                    labelText: "Подтвердите пароль",
                    //  prefixText: '+998 ',
                    filled: true, // Needed for adding a fill color
                    fillColor:
                        isSame ? ColorConst.error_red : const Color(0xffEEF3F9),
                    isDense: true, // Reduces height a bit
                    border: OutlineInputBorder(
                      borderSide: isSame
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
                        onTap: _toggleObscured2,
                        child: Icon(
                          _obscured2
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
                  padding: const EdgeInsets.only(right: 100, bottom: 55),
                  child: Text(
                    !isSame ? 'Не правильный пароль \t\t\t' : '',
                    style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 11),
                  ),
                ),
              ],
            ),
          ),

          // Switch Button

          Wrap(
            children: [
              Switch(
                value: value,
                onChanged: (val) {
                  value = val;
                },
              ),
              const Text(
                'Я Соглашаюсь с политикой\n конфидециальности ',
                style: TextStyle(
                    color: Colors.black, decoration: TextDecoration.underline),
              ),
              const Text('\t\t\t\t\t\t              ')
            ],
          ),

          SizedBox(height: 35.sp),
          //Button
          SizedBox(
            height: 35.sp,
            width: 199.sp,
            child: ElevatedButton(
              onPressed: () {
                var num = password_controller.text
                    .compareTo(password_controller2.text);
                print(num);

                num == 0 ? isSame = false : isSame = true;
                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor: const Color(0xff70ADEE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // <-- Radius
                ),
              ),
              child: const Text(
                'Продолжить',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ]));
  }

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
          color: ColorConst.error_red_brdr,
          width: 1.5,
        ));
  }

  OutlineInputBorder myfocusborderr() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide.none);
  }
}
