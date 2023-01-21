import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

class CustomPopup {
  static show(
      {required BuildContext context,
      required String from,
      required String msg,
      required CoolAlertType type,
      Function? onConfirmTap}) {
    CoolAlert.show(
        context: context,
        type: type,
        title: from,
        text: msg,
        backgroundColor: Colors.white,
        confirmBtnColor: Theme.of(context).primaryColor,
        confirmBtnText: "        OKAY         ",
        onConfirmBtnTap: () {
          Navigator.pop(context);
          onConfirmTap == null ? null : onConfirmTap();
        });
  }

  static showCustomDialog(
      {required BuildContext context,
      required String from,
      required Widget child}) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(from),
          content: child,
        );
      },
    );
  }
}
