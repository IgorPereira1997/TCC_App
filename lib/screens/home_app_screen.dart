import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tcc_fisio_app/res/custom_colors.dart';
import 'package:tcc_fisio_app/screens/reset_password_screen.dart';
import 'package:tcc_fisio_app/screens/signup_screen.dart';
import 'package:tcc_fisio_app/services/firebase_auth_methods.dart';
import 'package:tcc_fisio_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc_fisio_app/widgets/custom_button_transparent.dart';
import 'package:tcc_fisio_app/widgets/custom_field.dart';
import 'package:tcc_fisio_app/widgets/custom_field_password.dart';

class HomeAppScreen extends StatefulWidget {
  static String routeName = '/home';
  const HomeAppScreen({super.key});

  @override
  State<HomeAppScreen> createState() => _HomeAppScreenState();
}

class _HomeAppScreenState extends State<HomeAppScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void loginUser() {
    context.read<FirebaseAuthMethods>().loginWithEmail(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.appBackgroudColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Image.asset(
                  'lib/assets/fisioterapia_logo.png',
                  height: 500,
                ),
              ),
              CustomField(
                  choosedIcon: FontAwesomeIcons.idBadge,
                  labelText: 'Email',
                  controller: emailController,
                  enableSuggestions: true,
                  autocorrect: true,
                  keyboardType: TextInputType.text),
              const SizedBox(
                height: 10.0,
              ),
              CustomFieldPassword(
                  choosedIcon: FontAwesomeIcons.key,
                  labelText: 'Senha',
                  controller: passwordController,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.text),
              const SizedBox(
                height: 40.0,
              ),
              CustomButton(
                onTap: loginUser,
                text: 'Entrar',
              ),
              CustomButton(
                onTap: () {
                  if (context.mounted) {
                    Navigator.pushNamed(context, SignUpScreen.routeName);
                  }
                },
                text: 'Cadastrar',
              ),
              CustomTransparentButton(
                onTap: () {
                  if (context.mounted) {
                    Navigator.pushNamed(context, ResetPasswordScreen.routeName);
                  }
                },
                text: 'Esqueceu sua senha?',
              )
            ],
          ),
        ),
      ),
    );
  }
}
