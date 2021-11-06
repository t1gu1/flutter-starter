# Flutter starter

## Package used

- Firebase (firebase_core, firebase_auth, cloud_firestore)
- [GetX Documentation](https://github.com/jonataslaw/getx)
- [GetX storage package get_storage](https://github.com/jonataslaw/get_storage)
- crypto
- http
- csv

## External ressources

- [Loading Overlay](https://medium.com/@fayaz07/dont-kill-app-s-ui-thread-for-showing-loading-indicators-809e5a992230).
- [Amateur Coder GetX Videos](https://www.youtube.com/watch?v=CNpXbeI_slw)
- [Todo GetX example](https://medium.com/@loicgeek/flutter-how-to-create-a-todo-app-using-firebase-firestore-and-firebase-authentication-with-getx-89bdaacc6de6)

## Translations

![](https://cdn-images-1.medium.com/max/2000/0*9-A7El_nRDBz-ecK)

You can run a commandline app to generate the GetX Localization class which pulls from a [google sheet](https://docs.google.com/spreadsheets/d/1oS7iJ6ocrZBA53SxRfKF0CG9HAaXeKtzvsTBhgG4Zzk/edit#gid=0)

- Go to `/helpers/update_localizations.dart`
- Run with `dart update_localizations.dart`

## Firebase

Make sure you [setup firebase](https://firebase.google.com/docs/flutter/setup?platform=android) with your project

There should be things to replace:

- A file for IOS (`/ios/Runner/GoogleService-Info.plist`)
- A file for Android (`/android/app/google-services.json`)
- Credentials to replace for web. (In `/web/index.html`)

The rules in Firestore for this project are fairly simple. Here are the rules -created.

![](https://cdn-images-1.medium.com/max/2000/0*_lmwiYDofWZd0Kn0)

- The first rule matches any user in the admin collection and allows you to read that document only. No one is allowed to write to this collection. I manually add my admin users through the firebase console.

- The second rule allows the user to read and write only if the user matches the currently logged in user. So a user can only change information about themselves. Here is how my collections are setup in Firestore.

![](https://cdn-images-1.medium.com/max/2060/0*uFxZGvnPvviMebQ5)

## Themes

Use as far as you can the themes.

TODO: There is more to add here

## Overview of the project

**main.dart** — contains info for maintaining the state of the app for the theme, language and user. It initializes language and theme settings. Sets up routing.

## /constants/

**app_themes.dart** — contains info related to our light and dark themes.

**globals.dart** — contains some global app settings

**app_routes.dart** — contains the app routes.

## /controllers/

**auth_controller.dart** — our user and authentication functions for creating, logging in and out our user and saving our user data.

**language_controller.dart** — saves and loads our selected language.

**theme_controller.dart** — saves and loads our selected theme.

## /helpers/

**validator.dart** — contains some validation functions for our form fields.

**update_localizations.dart** — command line dart app that generates the localization.g.dart file.

**localizations.g.dart** — this file is generated from our google sheet (do not manually edit this file).

## /models/

**user_model.dart** — contains the model for our user saved in firestore.

**menu_option_model.dart** — contains our model for our language options and theme options in settings.

## /screens/

**home.dart** — contains the ui for the home which shows info about the user.

**settings.dart** — contains the settings screen for setting the theme and language and some user settings.

**splash.dart** — contains the initial loading screen, currently just a circular progress indicator.

## /screens/auth/

**reset-password.dart** — sends a password reset email to the user.

**sign-in.dart** — allows user to login with email and password.

**sign-up.dart** — allows user to create a new account.

**update-profile.dart** — allows user to change his email or name.

## /components/

**avatar.dart** — displays a user avatar on the home.

**dropdown_picker.dart** — shows a dropdown list.

**dropdown_picker_with_icon.dart** — shows a dropdown list with icons.

**form_input_field.dart** — handles our form field elements.

**form_input_field_with_icon.dart** — handles our form field elements but has an icon too.

**form_vertical_spacing.dart** — just a space in the ui.

**label_button.dart** — one type of button in ui.

**loading.dart** — circular loading indicator overlay.

**logo_graphic_header.dart** — a graphic displayed in our ui.

**primary_button.dart** — another button in the ui.

**segmented_selector.dart** — a control used to select the theme.
