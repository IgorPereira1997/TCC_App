import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc_fisio_app/res/custom_colors.dart';
import 'package:tcc_fisio_app/res/custom_functions.dart';
import 'package:tcc_fisio_app/screens/home_app_screen.dart';
import 'package:tcc_fisio_app/services/firebase_auth_methods.dart';
import 'package:tcc_fisio_app/utils/show_snackbar.dart';
import 'package:tcc_fisio_app/widgets/custom_back_button.dart';
import 'package:tcc_fisio_app/widgets/custom_button.dart';
import 'package:tcc_fisio_app/widgets/custom_field.dart';
import 'package:tcc_fisio_app/widgets/custom_field_password.dart';

class PhysioChangeEmailScreen extends StatelessWidget {
  static String routeName = '/physio-change-email';

  PhysioChangeEmailScreen({
    Key? key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String get email => _emailController.text;
  String get password => _passwordController.text;

  @override
  Widget build(BuildContext context) => GestureDetector(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: CustomColors.appBackgroudColor,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                reverse: false,
                child: Column(
                  children: [
                    const SizedBox(height: 20.0),
                    const CustomBackButton(),
                    const SizedBox(height: 100.0),
                    const Text(
                      "Alterar/Atualizar Email",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20.0),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          bottom: 20.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 16.0),
                            Text(
                              'Email Atual: ${FirebaseAuth.instance.currentUser!.email}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(height: 100.0),
                            CustomField(
                              choosedIcon: FontAwesomeIcons.envelope,
                              controller: _emailController,
                              labelText: 'Novo Email',
                              enableSuggestions: true,
                              autocorrect: true,
                              keyboardType: TextInputType.text,
                            ),
                            const SizedBox(height: 25.0),
                            CustomFieldPassword(
                              choosedIcon: FontAwesomeIcons.key,
                              controller: _passwordController,
                              labelText:
                                  'Digite a senha para confirmar a operação',
                              enableSuggestions: false,
                              autocorrect: false,
                              keyboardType: TextInputType.text,
                            ),
                            const SizedBox(
                              height: 100.0,
                            ),
                            CustomButton(
                              onTap: () async {
                                _formKey.currentState!.validate();
                                _formKey.currentState!.save();
                                if (email.isEmpty) {
                                  if (context.mounted) {
                                    showSnackBar(context,
                                        'O campo Novo Email está vazio. Por favor, preencha-o e tente novamente.');
                                  }
                                } else if (password.isEmpty) {
                                  if (context.mounted) {
                                    showSnackBar(context,
                                        'Por favor, digite a sua senha e tente novamente.');
                                  }
                                } else if (await isEmailRegistered(email)) {
                                  if (context.mounted) {
                                    showSnackBar(context,
                                        'Email digitado já está cadastrado no sistema!');
                                  }
                                } else if (!(await checkUserPassword(
                                    password))) {
                                  if (context.mounted) {
                                    showSnackBar(context,
                                        'A senha digitada está incorreta!');
                                  }
                                } else {
                                  if (context.mounted) {
                                    updateYourEmail(
                                        context: context, email: email);
                                    Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        HomeAppScreen.routeName,
                                        (route) => false);

                                    showSnackBar(context,
                                        'Foi enviada uma verificação para o novo email. Valide o novo email e faça login novamente.');
                                  }
                                }
                              },
                              text: 'Atualizar Email',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
