import 'package:bloc/bloc.dart';
import 'package:bozorbek_login/core/constants/color_const.dart';
import 'package:bozorbek_login/screen/register_bloc/register_state.dart';
import 'package:bozorbek_login/screen/register_f_page.dart';
import 'package:bozorbek_login/service/register_service.dart';
import 'package:bozorbek_login/service/verify_service.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInital());

  var smsContrl = TextEditingController();
  var name_contrl = TextEditingController();
  var phonNum;
  var phone_numController = TextEditingController();
  bool isWrongCode = false;
  bool didCodeSent = false;
  var maskFormatter = MaskTextInputFormatter(
      mask: '## ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  Future VerifyPost(BuildContext context, String phoneNum, String smsCode,
      String name) async {
    var data = await VerifyService.post(phoneNum, smsCode);

    if (data.toString().split(" ")[0] == "{message:") {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(_showScaffold(
          "SMS  SSSS  Yaxshi natija",
          color: ColorConst.greenish));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RegisterFPage(
                    phonNum: phoneNum,
                    smsCode: smsCode,
                    name: name,
                  )));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          _showScaffold("SSSSSSSxhamadi Brat", color: ColorConst.red));
    }
    emit(RegisterFState());
  }

  Future RegisterPost(BuildContext context, String phoneN) async {
    var data = await RegisterService.post(phoneN);
    var d = data.toString().split(" ");
    if (data.toString().split(" ")[0] == "{phone_num:") {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          _showScaffold("Yaxshi natija", color: ColorConst.greenish));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(_showScaffold("Oxhamadi Brat", color: ColorConst.red));
    }
        emit(RegisterFState());

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

  OutlineInputBorder myfocusborderL() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide.none);
  }
}
