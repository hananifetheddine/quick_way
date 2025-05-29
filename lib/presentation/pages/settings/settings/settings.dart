import 'package:get/get.dart';
import 'package:quick_way/presentation/components/dialog_box/log_out.dart';
import 'package:quick_way/presentation/controllers/settings/settings.dart';
import 'package:flutter/material.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () => showDialogLogOut(), child: Text("Déconnecter"))
      ],
    );
  }
}
