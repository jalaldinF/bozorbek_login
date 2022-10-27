import 'package:bloc/bloc.dart';
import 'package:bozorbek_login/core/constants/color_const.dart';
import 'package:bozorbek_login/screen/register_f_cubit/register_f_state.dart';
import 'package:bozorbek_login/service/setpassword_service.dart';
import 'package:flutter/material.dart';

class RegisterFCubit extends Cubit<RegisterFFState> {
  RegisterFCubit() : super(RegisterFInital());

  bool isSame = false;
  bool value = false;
  bool obscured = true;
  bool obscured2 = true;
  final textFieldFocusNode = FocusNode();
  final textFieldFocusNode2 = FocusNode();
  final password_controller = TextEditingController();
  final password_controller2 = TextEditingController();

  void toggleObscured() {
    obscured = !obscured;
    if (textFieldFocusNode.hasPrimaryFocus) {
      return;
    } // If focus is on text field, dont unfocus
    textFieldFocusNode.canRequestFocus = false; // Prevents focus if tap on eye

    emit(RegisterfState());
  }

  void toggleObscured2() {
    obscured2 = !obscured2;
    if (textFieldFocusNode2.hasPrimaryFocus) {
      return;
    } // If focus is on text field, dont unfocus
    textFieldFocusNode2.canRequestFocus = false; // Prevents focus if tap on eye
    emit(RegisterfState());
  }

  SnackBar showScaffold(BuildContext context, String message, {Color? color}) {
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

  Future SetPasswordPost(BuildContext context, String phonNum, String smsCode,
      String password, String name) async {
    var data = await SetPasswordService.post(phonNum, smsCode, password, name);
    var d = data.toString().split(" ");
    if (data.toString().split(" ")[0] == "{username:") {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          showScaffold(context, "Yaxshi natija", color: ColorConst.greenish));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          showScaffold(context, "Oxhamadi Brat", color: ColorConst.red));
    }
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

   VerifyPassword(
      BuildContext context, String phonNum, String smsCode, String name) {
    var num = password_controller.text.compareTo(password_controller2.text);
    print(num);

    num == 0 ? isSame = false : isSame = true;

    if (!isSame) {
      SetPasswordPost(
          context, phonNum, smsCode, password_controller.text, name);
    }
    emit(RegisterfState());
  }
}
