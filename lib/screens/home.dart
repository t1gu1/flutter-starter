import 'package:flutter/material.dart';
import 'package:flutter_starter/components/index.dart';
import 'package:flutter_starter/layouts/defaultLayout.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        displayMenu: true,
        children: (controller) => [
              Image.network(
                  'https://th.bing.com/th/id/R.307c5b29d72d59a1d1d8926685451e67?rik=rSywjZobiTg6Bw&riu=http%3a%2f%2fwallpapercave.com%2fwp%2fRsyHRBx.jpg&ehk=8NDBntKhuI6r6Yl7lmKECZZdrLVJ4EfrAYC6Cd5ZJqU%3d&risl=&pid=ImgRaw&r=0',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  height: 300),
              Center(
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
              )
            ]);
  }
}
