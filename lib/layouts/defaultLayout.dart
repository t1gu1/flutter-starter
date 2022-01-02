import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/components/menu.dart';
import 'package:flutter_starter/controllers/index.dart';
import 'package:flutter_starter/screens/index.dart';
import 'package:get/get.dart';

/// Define the screen layout.
///
/// [children] will be inject into a ListView.
///
/// [child] will let you decide exactly what you want without parent.
///
/// [title] if you set null, it will display the APP TITLE. You can put anything here and it will display.
// ignore: must_be_immutable
class DefaultLayout extends StatelessWidget {
  DefaultLayout(
      {this.child,
      this.children,
      this.title = false,
      this.displayMenu = false,
      this.displayBack = false,
      this.extendBodyBehindAppBar = true,
      this.leadingWidth = 0}) {
    // Always hide back button in web to use the browser one
    if (kIsWeb) {
      displayBack = false;
    }

    // Calculate the leadingWidth necessary to display all buttons
    leadingWidth = displayBack && displayMenu
        ? 80
        : !displayBack && !displayMenu
            ? 0
            : 40;
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  final dynamic children;
  final dynamic child;
  final bool displayMenu;
  final bool extendBodyBehindAppBar;

  dynamic title;
  bool displayBack;
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
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  automaticallyImplyLeading: true,
                  title: title != false
                      ? title
                      : TextButton(
                          style: ButtonStyle(
                              overlayColor: MaterialStateProperty.resolveWith(
                                  (Set<MaterialState> states) =>
                                      Colors.transparent)),
                          onPressed: () {
                            Get.offAll(HomeScreen());
                          },
                          child: Text(
                            "My App",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                  centerTitle: true,
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
                body: child != null
                    ? child(controller)
                    : ListView(
                        padding: EdgeInsets.all(0),
                        children: children(controller)),
                extendBodyBehindAppBar: extendBodyBehindAppBar,
              );
      },
    );
  }
}
