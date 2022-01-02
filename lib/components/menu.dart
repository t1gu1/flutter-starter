import 'package:flutter/material.dart';
import 'package:flutter_starter/controllers/index.dart';
import 'package:flutter_starter/screens/settings.dart';
import 'package:get/get.dart';
import 'package:tinycolor2/tinycolor2.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(AuthController.to.firestoreUser.value!.name),
                accountEmail:
                    Text(AuthController.to.firestoreUser.value!.email),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.network(
                      AuthController.to.firestoreUser.value!.photoUrl,
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: TinyColor(Theme.of(context).primaryColor)
                      .darken(10)
                      .color,
                ),
              ),
              Positioned(
                right: 8.0,
                top: 8.0,
                child: IconButton(
                  icon: Icon(Icons.close),
                  color: Colors.white,
                  onPressed: () => Navigator.pop(context, false),
                ),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Get.to(SettingsScreen())},
          ),
          Divider(),
          ListTile(
            title: Text('settings.signOut'.tr),
            leading: Icon(Icons.exit_to_app),
            onTap: () => {AuthController.to.signOut()},
          ),
        ],
      ),
    );
  }
}
