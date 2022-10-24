import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class PhoneNumbForm {
  void formateNum(String txt, TextEditingController cntrl) {
    cntrl.text = '${txt}_';
    cntrl.selection = TextSelection.collapsed(offset: cntrl.text.length);
  }
}
