import 'package:flutter/material.dart';
import 'package:flutter_starter/components/menu.dart';
import 'package:flutter_starter/controllers/index.dart';
import 'package:flutter_starter/components/index.dart';
import 'package:flutter_starter/screens/index.dart';
import 'package:get/get.dart';

class DefaultLayout extends StatelessWidget {
  DefaultLayout(
      {this.child,
      this.title,
      this.displayMenu = false,
      this.displayBack = false,
      this.leadingWidth = 0}) {
    leadingWidth = displayBack && displayMenu
        ? 80
        : !displayBack && !displayMenu
            ? 0
            : 40;
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  final dynamic child;
  final dynamic title;
  final bool displayMenu;
  final bool displayBack;

  double leadingWidth;

  @override
  Widget build(BuildContext context) {
    // print(Navigator.of(context).history);

    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        return controller.firestoreUser.value?.uid == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                key: _key, // Assign the key to Scaffold.
                appBar: AppBar(
                  automaticallyImplyLeading: true,
                  title: title,
                  leading: Row(children: [
                    if (displayBack)
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context, false),
                      ),
                    if (displayMenu)
                      IconButton(
                        //menu icon button at start left of appbar
                        onPressed: () => _key.currentState!
                            .openDrawer(), // <-- Opens drawer.
                        icon: Icon(Icons.menu),
                      ),
                  ]),
                  leadingWidth: leadingWidth,
                  // leading: Container(),
                  actions: [
                    IconButton(
                        icon: Icon(Icons.settings),
                        onPressed: () {
                          Get.to(SettingsScreen());
                        }),
                  ],
                ),
                drawer: displayMenu ? Menu() : null,
                body: child(controller),
              );
      },
    );
  }
}
