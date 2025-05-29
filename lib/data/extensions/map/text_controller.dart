import 'package:flutter/cupertino.dart';

extension TextEditingExtension on TextEditingController {
  get trimText => text.trim();
}
