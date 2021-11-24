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
        return controller.firestoreUser.value?.uid == null
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
                body: Section(
                  type: SectionType.fullWidthWithPadding,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 120),
                        Avatar(controller.firestoreUser.value!),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            VerticalSpace(),
                            ...[
                              "${'home.uidLabel'.tr}: ${controller.firestoreUser.value!.uid}",
                              // TODO: BUG: The name dont change after updating profile. Seems to be a tick late.
                              "${'home.nameLabel'.tr}: ${controller.firestoreUser.value!.name}",
                              "${'home.emailLabel'.tr}: ${controller.firestoreUser.value!.email}",
                              "${'home.adminUserLabel'.tr}: ${controller.admin.value.toString()}",
                            ].map((info) => Container(
                                  margin: EdgeInsets.all(8.0),
                                  child: Text(info,
                                      style: TextStyle(fontSize: 20)),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ));
      },
    );
  }
}
