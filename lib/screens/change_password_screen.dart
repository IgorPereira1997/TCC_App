import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:tcc_fisio_app/res/custom_colors.dart';
import 'package:tcc_fisio_app/screens/home_app_screen.dart';
import 'package:tcc_fisio_app/services/firebase_auth_methods.dart';
import 'package:tcc_fisio_app/utils/show_snackbar.dart';
import 'package:tcc_fisio_app/widgets/custom_back_button.dart';
import 'package:tcc_fisio_app/widgets/custom_button.dart';
import 'package:tcc_fisio_app/widgets/custom_field.dart';

class PhysioChangePasswordScreen extends StatefulWidget {
  static String routeName = '/physio-change-password';

  const PhysioChangePasswordScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PhysioChangePasswordScreen> createState() =>
      _PhysioChangePasswordScreenState();
}

class _PhysioChangePasswordScreenState
    extends State<PhysioChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _email; // ignore: unused_field
  String? _password; // ignore: unused_field

  final _passwordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _newPasswordConfirmController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return GestureDetector(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: CustomColors.appBackgroudColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  const CustomBackButton(),
                  const SizedBox(height: 70.0),
                  const Text(
                    "Alterar/Atualizar Senha",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50.0),
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
                          const Text(
                            'Para alterar a sua senha, preencha os campos abaixo:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 50.0),
                          CustomField(
                            choosedIcon: FontAwesomeIcons.lock,
                            controller: _passwordController,
                            labelText: 'Senha Atual',
                            obscureText: true,
                            enableSuggestions: true,
                            autocorrect: true,
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              setState(() {
                                _email = value;
                              });
                              return null;
                            },
                          ),
                          const SizedBox(height: 60.0),
                          CustomField(
                            choosedIcon: FontAwesomeIcons.key,
                            controller: _newPasswordController,
                            labelText: 'Digite a nova senha',
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              setState(() {
                                _password = value;
                              });
                              return null;
                            },
                          ),
                          const SizedBox(height: 25.0),
                          CustomField(
                            choosedIcon: FontAwesomeIcons.key,
                            controller: _newPasswordConfirmController,
                            labelText: 'Digite novamente a nova senha',
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              setState(() {
                                _password = value;
                              });
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          CustomButton(
                            onTap: () async {
                              if (password.isEmpty) {
                                if (context.mounted) {
                                  showSnackBar(context,
                                      'Por favor, digite a sua senha atual e tente novamente.');
                                }
                              } else if (newPassword.isEmpty) {
                                if (context.mounted) {
                                  showSnackBar(context,
                                      'Por favor, digite a sua nova senha e tente novamente.');
                                }
                              } else if (newPasswordConfirm.isEmpty) {
                                if (context.mounted) {
                                  showSnackBar(context,
                                      'Por favor, digite a confirmação de sua nova senha e tente novamente.');
                                }
                              } else if (!(await checkUserPassword(password))) {
                                if (context.mounted) {
                                  showSnackBar(context,
                                      'A senha digitada está incorreta!');
                                }
                              } else if (newPassword != newPasswordConfirm) {
                                if (context.mounted) {
                                  showSnackBar(context,
                                      'A nova senha e sua confirmação diferem. Por favor, verifique-as e tente novamente.');
                                }
                              } else {
                                await user!.updatePassword(newPassword);
                                FirebaseAuth.instance.signOut();
                                if (context.mounted) {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      HomeAppScreen.routeName,
                                      (route) => false);

                                  showSnackBar(context,
                                      'A sua senha foi atualizada com sucesso. Faça o login novamente.');
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

  String get password => _passwordController.text;

  String get newPassword => _newPasswordController.text;

  String get newPasswordConfirm => _newPasswordConfirmController.text;
}
