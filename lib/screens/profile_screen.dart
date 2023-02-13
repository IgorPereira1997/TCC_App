import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:tcc_fisio_app/res/custom_colors.dart';
import 'package:tcc_fisio_app/widgets/custom_back_button.dart';
import 'package:tcc_fisio_app/widgets/custom_button.dart';
import 'package:tcc_fisio_app/widgets/custom_signup_field.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController cpfController = TextEditingController();
    TextEditingController crefitoController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController telController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: CustomColors.appBackgroudColor,
        body: SafeArea(
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                const CustomBackButton(),
                const SizedBox(height: 20.0),
                const Text(
                  "Perfil",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 70.0),
                const Icon(FontAwesomeIcons.circleUser, size: 150),
                const SizedBox(height: 70.0),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    bottom: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /*CustomButton(
                        onTap: () {
                          context.read<FirebaseAuthMethods>().signOut(context);
                        },
                        text: 'Sign Out',
                      ),
                      CustomButton(
                        onTap: () {
                          context
                              .read<FirebaseAuthMethods>()
                              .deleteAccount(context);
                        },
                        text: 'Delete Account',
                      ),*/
                      CustomField(
                        choosedIcon: FontAwesomeIcons.userDoctor,
                        labelText: 'Nome',
                        validator: teste,
                        controller: nameController,
                        obscureText: false,
                        enableSuggestions: true,
                        autocorrect: true,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 20.0),
                      CustomField(
                        choosedIcon: FontAwesomeIcons.envelope,
                        controller: emailController,
                        labelText: 'Email',
                        obscureText: false,
                        enableSuggestions: true,
                        autocorrect: true,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20.0),
                      CustomField(
                        choosedIcon: FontAwesomeIcons.phone,
                        controller: telController,
                        labelText: 'Telefone',
                        obscureText: false,
                        enableSuggestions: true,
                        autocorrect: true,
                        keyboardType: TextInputType.phone,
                      ),

                      // Lugar para fazer a troca da senha
                      const SizedBox(
                        height: 40.0,
                      ),
                      CustomButton(onTap: () {}, text: 'Mudar Senha'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? teste(String? value) {
    if (value!.isEmpty) {
      print('O campo é obrigatório.');
    }
    return null;
  }
}
