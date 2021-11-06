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
      builder: (controller) => controller.firestoreUser.value!.uid == null
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
                        Text(
                            "${'home.uidLabel'.tr}: ${controller.firestoreUser.value!.uid}",
                            style: TextStyle(fontSize: 16)),
                        FormVerticalSpace(),
                        Text(
                            "${'home.nameLabel'.tr}: ${controller.firestoreUser.value!.name}",
                            style: TextStyle(fontSize: 16)),
                        FormVerticalSpace(),
                        Text(
                            "${'home.emailLabel'.tr}: ${controller.firestoreUser.value!.email}",
                            style: TextStyle(fontSize: 16)),
                        FormVerticalSpace(),
                        Text(
                            "${'home.adminUserLabel'.tr}: ${controller.admin.value.toString()}",
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
