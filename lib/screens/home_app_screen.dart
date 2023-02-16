import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcc_fisio_app/res/custom_colors.dart';
import 'package:tcc_fisio_app/screens/signup_screen.dart';
import 'package:tcc_fisio_app/services/firebase_auth_methods.dart';
import 'package:tcc_fisio_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc_fisio_app/widgets/custom_button_transparent.dart';
import 'package:tcc_fisio_app/widgets/custom_signup_field.dart';

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
    //final user = context.read<FirebaseAuthMethods>().user;
    //final fullName = user.displayName!.split(' ');
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
              //const SizedBox(height: 150.0),
              //Text(
              //  "AvaliaFisio",
              //  textAlign: TextAlign.center,
              //  style: GoogleFonts.josefinSans(
              //    color: Colors.white,
              //    fontSize: 30,
              //    fontWeight: FontWeight.bold,
              //  ),
              //),
              //const SizedBox(height: 30.0),
              Flexible(
                flex: 1,
                child: Image.asset(
                  'lib/assets/fisioterapia_logo.png',
                  height: 500,
                ),
              ),
              //const SizedBox(height: 50.0),
              CustomField(
                  choosedIcon: FontAwesomeIcons.idBadge,
                  labelText: 'Email',
                  controller: emailController,
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
                height: 40.0,
              ),
              CustomButton(
                onTap: loginUser,
                text: 'Entrar',
              ),
              CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, SignUpScreen.routeName);
                },
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
