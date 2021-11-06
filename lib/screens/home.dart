import 'package:flutter/material.dart';
import 'package:flutter_starter/controllers/index.dart';
import 'package:flutter_starter/components/index.dart';
import 'package:flutter_starter/screens/index.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        final profileInfo = [
          "${'home.uidLabel'.tr}: ${controller.firestoreUser.value!.uid}",
          "${'home.nameLabel'.tr}: ${controller.firestoreUser.value!.name}",
          "${'home.emailLabel'.tr}: ${controller.firestoreUser.value!.email}",
          "${'home.adminUserLabel'.tr}: ${controller.admin.value.toString()}",
        ];

        return controller.firestoreUser.value!.uid == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                appBar: AppBar(
                  title: Text('home.title'.tr),
                  actions: [
                    IconButton(
                        icon: Icon(Icons.settings),
                        onPressed: () {
                          Get.to(SettingsScreen());
                        }),
                  ],
                ),
                body: Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 120),
                      Avatar(controller.firestoreUser.value!),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FormVerticalSpace(),
                          ...profileInfo.map((info) => Container(
                                margin: EdgeInsets.all(8.0),
                                child:
                                    Text(info, style: TextStyle(fontSize: 20)),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
