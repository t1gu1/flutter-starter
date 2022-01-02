import 'package:flutter/material.dart';
import 'package:flutter_starter/controllers/index.dart';
import 'package:flutter_starter/screens/settings.dart';
import 'package:get/get.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Oflutter.com'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://pbs.twimg.com/media/DUfDNvTVQAA2osS.jpg:large',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black54,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://th.bing.com/th/id/R.307c5b29d72d59a1d1d8926685451e67?rik=rSywjZobiTg6Bw&riu=http%3a%2f%2fwallpapercave.com%2fwp%2fRsyHRBx.jpg&ehk=8NDBntKhuI6r6Yl7lmKECZZdrLVJ4EfrAYC6Cd5ZJqU%3d&risl=&pid=ImgRaw&r=0')),
            ),
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
