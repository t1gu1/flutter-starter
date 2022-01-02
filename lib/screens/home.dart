import 'package:flutter/material.dart';
import 'package:flutter_starter/components/index.dart';
import 'package:flutter_starter/layouts/defaultLayout.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: Text('home.title'.tr),
        displayMenu: true,
        child: (controller) => Section(
              type: SectionType.fullWidthWithPadding,
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 120),
                    // Avatar(controller.firestoreUser.value!),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        VerticalSpace(),
                        ...[
                          "${'home.uidLabel'.tr}: ${controller.firestoreUser.value!.uid}",
                          "${'home.nameLabel'.tr}: ${controller.firestoreUser.value!.name}",
                          "${'home.emailLabel'.tr}: ${controller.firestoreUser.value!.email}",
                          "${'home.adminUserLabel'.tr}: ${controller.admin.value.toString()}",
                        ].map((info) => Container(
                              margin: EdgeInsets.all(8.0),
                              child: Text(info, style: TextStyle(fontSize: 20)),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}
