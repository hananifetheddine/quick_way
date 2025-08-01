import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../resources/theme_manager.dart';

toast(String msg) => Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: ThemeManager.oppositeColor,
    textColor: ThemeManager.backgroundColor,
    fontSize: 16.0);
