import 'package:flutter/cupertino.dart';

extension TextEditingControllerExtension on TextEditingController {
  select() {
    print(text.length);
    selection = TextSelection(
      baseOffset: 0,
      extentOffset: text.length,
    );
  }
}
