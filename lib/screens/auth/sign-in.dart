import 'package:flutter/material.dart';

import 'dart:core';
import 'package:get/get.dart';
import 'package:flutter_starter/screens/auth/index.dart';
import 'package:flutter_starter/components/index.dart';
import 'package:flutter_starter/helpers/index.dart';
import 'package:flutter_starter/controllers/index.dart';

class SignInScreen extends StatelessWidget {
  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void onSubmit(context) async {
    if (_formKey.currentState!.validate()) {
      authController.signInWithEmailAndPassword(context);
    }
  }

  @override
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
                  FormInputFieldWithIcon(
                    controller: authController.emailController,
                    iconPrefix: Icons.email,
                    labelText: 'auth.emailFormField'.tr,
                    validator: Validator().email,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => {},
                    onSaved: (value) =>
                        authController.emailController.text = value!,
                    onFieldSubmitted: (value) => onSubmit(context),
                  ),
                  VerticalSpace(),
                  FormInputFieldWithIcon(
                    controller: authController.passwordController,
                    iconPrefix: Icons.lock,
                    labelText: 'auth.passwordFormField'.tr,
                    validator: Validator().password,
                    obscureText: true,
                    onChanged: (value) => {},
                    onSaved: (value) =>
                        authController.passwordController.text = value!,
                    maxLines: 1,
                    onFieldSubmitted: (value) => onSubmit(context),
                  ),
                  VerticalSpace(),
                  PrimaryButton(
                      labelText: 'auth.signInButton'.tr,
                      onPressed: () {
                        onSubmit(context);
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
