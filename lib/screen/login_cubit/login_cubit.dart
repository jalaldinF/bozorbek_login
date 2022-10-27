import 'package:bloc/bloc.dart';
import 'package:bozorbek_login/core/constants/color_const.dart';
import 'package:bozorbek_login/logic/phone_num_form.dart';
import 'package:bozorbek_login/screen/login_cubit/login_state.dart';
import 'package:bozorbek_login/service/login_sevice.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

var maskFormatter = MaskTextInputFormatter(
      mask: '## ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  var form = PhoneNumbForm();
  var login_contrl = TextEditingController(); //login textfield controller
  final textFieldFocusNode = FocusNode();
  bool obscured = true;
  final password_controller = TextEditingController();
  bool error = false;



  Future loginPost(
      {required BuildContext context,
      required String phoneNumber,
      required String password}) async {
    var data = await LoginService.post(phoneNumber, password);

    if (data.toString().split(" ")[0] == "{refresh:") {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          _showScaffold("Yaxshi natija", color: ColorConst.greenish));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(_showScaffold("Oxhamadi Brat", color: ColorConst.red));
    }
    emit(RegisterState());
  }

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
   void toggleObscured() {
      obscured = !obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return;
      } // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    
  }

  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return const OutlineInputBorder(
        //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide.none);
  }

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
          color: ColorConst.error_red_brdr,
          width: 1.5,
        ));
  }

  OutlineInputBorder myfocusborderL() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide.none);
  }

  OutlineInputBorder myfocusborderr() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide.none);
  }
}
