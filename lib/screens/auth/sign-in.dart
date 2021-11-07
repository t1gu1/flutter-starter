import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:core';
import 'package:get/get.dart';
import 'package:flutter_starter/screens/auth/index.dart';
import 'package:flutter_starter/components/index.dart';
import 'package:flutter_starter/helpers/index.dart';
import 'package:flutter_starter/controllers/index.dart';

class SignInScreen extends StatelessWidget {
  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Section(
          type: SectionType.fullWidthWithPadding,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LogoGraphicHeader(),
                  VerticalSpace(height: 48),
                  Container(
                      constraints: BoxConstraints(maxWidth: 320),
                      child: FormInputFieldWithIcon(
                        controller: authController.emailController,
                        iconPrefix: Icons.email,
                        labelText: 'auth.emailFormField'.tr,
                        validator: Validator().email,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) => null,
                        onSaved: (value) =>
                            authController.emailController.text = value!,
                      )),
                  VerticalSpace(),
                  Container(
                      constraints: BoxConstraints(maxWidth: 320),
                      child: FormInputFieldWithIcon(
                        controller: authController.passwordController,
                        iconPrefix: Icons.lock,
                        labelText: 'auth.passwordFormField'.tr,
                        validator: Validator().password,
                        obscureText: true,
                        onChanged: (value) => null,
                        onSaved: (value) =>
                            authController.passwordController.text = value!,
                        maxLines: 1,
                      )),
                  VerticalSpace(),
                  PrimaryButton(
                      labelText: 'auth.signInButton'.tr,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          authController.signInWithEmailAndPassword(context);
                        }
                      }),
                  VerticalSpace(),
                  LabelButton(
                    labelText: 'auth.resetPasswordLabelButton'.tr,
                    onPressed: () => Get.to(ResetPasswordScreen()),
                  ),
                  LabelButton(
                    labelText: 'auth.signUpLabelButton'.tr,
                    onPressed: () => Get.to(SignUpScreen()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
