import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tcc_fisio_app/res/custom_colors.dart';
import 'package:tcc_fisio_app/services/firebase_auth_methods.dart';
import 'package:tcc_fisio_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc_fisio_app/widgets/custom_button_transparent.dart';
import 'package:tcc_fisio_app/widgets/custom_signup_field.dart';

class HomeAppScreen extends StatelessWidget {
  const HomeAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController crefitoController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final user = context.read<FirebaseAuthMethods>().user;
    final fullName = user.displayName!.split(' ');
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
              const SizedBox(height: 50.0),
              const Text(
                "EasyCIF",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50.0),
              Flexible(
                flex: 1,
                child: Image.asset(
                  'lib/assets/fisioterapia_logo.png',
                  height: 300,
                ),
              ),
              const SizedBox(height: 50.0),
              CustomField(
                  choosedIcon: FontAwesomeIcons.idBadge,
                  labelText: 'CREFITO',
                  controller: crefitoController,
                  obscureText: false,
                  enableSuggestions: true,
                  autocorrect: true,
                  keyboardType: TextInputType.text),
              const SizedBox(
                height: 10.0,
              ),
              CustomField(
                  choosedIcon: FontAwesomeIcons.key,
                  labelText: 'Senha',
                  controller: passwordController,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.text),
              const SizedBox(
                height: 20.0,
              ),
              CustomButton(
                onTap: () {},
                text: 'Entrar',
              ),
              CustomButton(
                onTap: () {},
                text: 'Cadastrar',
              ),
              CustomTransparentButton(
                onTap: () {},
                text: 'Esqueceu sua senha?',
              )
            ],
          ),
        ),
      ),
    );
  }
}
