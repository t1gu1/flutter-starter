import 'package:flutter/material.dart';
import 'package:flutter_starter/layouts/defaultLayout.dart';
import 'package:flutter_starter/screens/auth/index.dart';
import 'package:get/get.dart';
import 'package:flutter_starter/components/segmented_selector.dart';
import 'package:flutter_starter/controllers/index.dart';
import 'package:flutter_starter/components/index.dart';
import 'package:flutter_starter/models/index.dart';
import 'package:flutter_starter/constants/index.dart';

class SettingsScreen extends StatelessWidget {
  //final LanguageController languageController = LanguageController.to;
  //final ThemeController themeController = ThemeController.to;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: Text('settings.title'.tr),
      displayBack: true,
      child: (controller) => _buildLayoutSection(context),
    );
  }

  Widget _buildLayoutSection(BuildContext context) {
    return ListView(
      children: <Widget>[
        languageListTile(context),
        themeListTile(context),
        ListTile(
            title: Text('settings.updateProfile'.tr),
            trailing: ElevatedButton(
              onPressed: () async {
                Get.to(UpdateProfileScreen());
              },
              child: Text(
                'settings.updateProfile'.tr,
              ),
            )),
        ListTile(
          title: Text('settings.signOut'.tr),
          trailing: ElevatedButton(
            onPressed: () {
              AuthController.to.signOut();
            },
            child: Text(
              'settings.signOut'.tr,
            ),
          ),
        )
      ],
    );
  }

  languageListTile(BuildContext context) {
    return GetBuilder<LanguageController>(
      builder: (controller) => ListTile(
        title: Text('settings.language'.tr),
        trailing: DropdownPicker(
          menuOptions: Globals.languageOptions,
          selectedOption: controller.currentLanguage,
          onChanged: (value) async {
            await controller.updateLanguage(value!);
            Get.forceAppUpdate();
          },
        ),
      ),
    );
  }

  themeListTile(BuildContext context) {
    final List<MenuOptionsModel> themeOptions = [
      MenuOptionsModel(
          key: "system", value: 'settings.system'.tr, icon: Icons.brightness_4),
      MenuOptionsModel(
          key: "light", value: 'settings.light'.tr, icon: Icons.brightness_low),
      MenuOptionsModel(
          key: "dark", value: 'settings.dark'.tr, icon: Icons.brightness_3)
    ];

    return GetBuilder<ThemeController>(
      builder: (controller) => ListTile(
        title: Text('settings.theme'.tr),
        trailing: SegmentedSelector(
          selectedOption: controller.currentTheme,
          menuOptions: themeOptions,
          onValueChanged: (value) {
            controller.setThemeMode(value);
          },
        ),
      ),
    );
  }
}
