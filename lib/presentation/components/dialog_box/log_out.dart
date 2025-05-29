import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/settings/settings.dart';
import '../../resources/styles_manager.dart';
import 'base.dart';

void showDialogLogOut() {
  showBaseAnimatedDialogBox(
    widget: Builder(
      builder: (context) {
        final controller = Get.find<SettingsController>();
        return Material(
          type: MaterialType.transparency,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Confirm Logout',
                style: getBoldStyle(
                  color: Colors.redAccent,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Are you sure you want to log out? You will need to log in again to access your account.',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text(
                      'Cancel',
                      style: getMediumStyle(color: Colors.grey),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: controller.singOut,
                    child: Text(
                      'Logout',
                      style: getMediumStyle(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ),
  );
}
