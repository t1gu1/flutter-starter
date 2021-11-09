# Flutter starter

GetX simplify & optimise a lot how to use Flutter!

You should read a bit about GetX and Firebase.

## Package used

- Firebase (firebase_core, firebase_auth, cloud_firestore)
- [GetX](https://github.com/jonataslaw/getx)
- [get_storage](https://github.com/jonataslaw/get_storage)
- crypto
- http
- csv (Use to convert csv of google excel translations)

## External resources

- [Loading Overlay](https://medium.com/@fayaz07/dont-kill-app-s-ui-thread-for-showing-loading-indicators-809e5a992230).
- [Amateur Coder GetX Videos](https://www.youtube.com/watch?v=CNpXbeI_slw)
- [Todo GetX example](https://medium.com/@loicgeek/flutter-how-to-create-a-todo-app-using-firebase-firestore-and-firebase-authentication-with-getx-89bdaacc6de6)

## Commons commands

- `flutter run` will run the app on a device. (It will ask which devices if you got few)
- `flutter devices` will show you your devices list.
- `flutter run -d {device}` will run on the chosen device.
- `flutter build {web | ios | android}` will build the app for the chosen platform.
- `flutter run --release` will let you test an optimized build (Like the release).

## Translations

![](https://cdn-images-1.medium.com/max/2000/0*9-A7El_nRDBz-ecK)

You can run a commandline app to generate the GetX Localization class which pulls from a [google sheet](https://docs.google.com/spreadsheets/d/1oS7iJ6ocrZBA53SxRfKF0CG9HAaXeKtzvsTBhgG4Zzk/edit#gid=0)

- Go to `/helpers/update_localizations.dart`
- Run with `dart update_localizations.dart`

## Firebase

It's currently link to a test one on mine (To make your test rapidly of that Repo #imSoNice) but if make sure you [setup firebase](https://firebase.google.com/docs/flutter/setup?platform=android) with your project to continue your development.

There should be things to replace: (When you will setup your proper firebase)

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

Tips: Try to use & edit app_themes constants as more as you can.

**app_themes.dart** — contains info related to our light and dark themes.

**globals.dart** — contains some global app settings

**app_routes.dart** — contains the app routes.

## /controllers/

Tips: The controllers are contains a lot of logic and think it a way to be reusable!

**auth_controller.dart** — our user and authentication functions for creating, logging in and out our user and saving our user data.

**language_controller.dart** — saves and loads our selected language.

**theme_controller.dart** — saves and loads our selected theme.

## /helpers/

Tips: The google excel way is sooo nice. Use that update_localizations script!

**validator.dart** — contains some validation functions for our form fields.

**update_localizations.dart** — command line dart app that generates the localization.g.dart file.

**localizations.g.dart** — this file is generated from our google sheet (do not manually edit this file).

## /models/

**user_model.dart** — contains the model for our user saved in Firestore.

**menu_option_model.dart** — contains our model for our language options and theme options in settings.

## /screens/

Tips:

- Screens should use components and add max-width, margin & spacing between them.
- The screens file name should has similar name if not a exact name as the url & className should be like `NameScreen`.

**home.dart** — contains the ui for the home which shows info about the user.

**settings.dart** — contains the settings screen for setting the theme and language and some user settings.

**splash.dart** — contains the initial loading screen, currently just a circular progress indicator.

### /screens/auth/

Tips: If there is a lot of screen that share a common purpose, group them in a folder.

**reset-password.dart** — sends a password reset email to the user.

**sign-in.dart** — allows user to login with email and password.

**sign-up.dart** — allows user to create a new account.

**update-profile.dart** — allows user to change his email or name.

## /components/

Tips: The components should NOT have a max-width, margin/padding most of the time!
I mean except for the components with that purpose like the Section.

**section.dart** — Add a padding(left/right) and max-width for a section. Imagine (Layout -> Section -> Content/Components)

**avatar.dart** — displays a user avatar on the home.

**dropdown_picker.dart** — shows a dropdown list.

**dropdown_picker_with_icon.dart** — shows a dropdown list with icons.

**form_input_field.dart** — handles our form field elements.

**form_input_field_with_icon.dart** — handles our form field elements but has an icon too.

**vertical_spacing.dart** — just a space in the ui.

**label_button.dart** — one type of button in ui.

**loading.dart** — circular loading indicator overlay.

**logo_graphic_header.dart** — a graphic displayed in our ui.

**primary_button.dart** — another button in the ui.

**segmented_selector.dart** — a control used to select the theme.
