import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc_fisio_app/res/custom_colors.dart';
import 'package:tcc_fisio_app/res/custom_functions.dart';
import 'package:tcc_fisio_app/services/firebase_auth_methods.dart';
import 'package:tcc_fisio_app/utils/show_snackbar.dart';
import 'package:tcc_fisio_app/widgets/custom_back_button.dart';
import 'package:tcc_fisio_app/widgets/custom_button.dart';
import 'package:tcc_fisio_app/widgets/custom_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  static String routeName = '/reset-password';
  ResetPasswordScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();

  String get firstName => _firstNameController.text;
  String get lastName => _lastNameController.text;
  String get cpf => cleanCPF(_cpfController.text);
  String get email => _emailController.text;

  @override
  Widget build(BuildContext context) => GestureDetector(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: CustomColors.appBackgroudColor,
          body: SafeArea(
            child: SingleChildScrollView(
              reverse: false,
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  const CustomBackButton(),
                  const SizedBox(height: 70.0),
                  const Text(
                    "Recuperação de Senha",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 100.0),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      "Informe os dados abaixo para proceder com a recuperação de senha:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
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
                          CustomField(
                            choosedIcon: FontAwesomeIcons.userDoctor,
                            labelText: 'Nome',
                            controller: _firstNameController,
                            enableSuggestions: true,
                            autocorrect: true,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, preencha o seu nome';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20.0),
                          CustomField(
                            choosedIcon: FontAwesomeIcons.userDoctor,
                            labelText: 'Sobrenome',
                            controller: _lastNameController,
                            enableSuggestions: true,
                            autocorrect: true,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, preencha o seu sobrenome';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20.0),
                          CustomField(
                            choosedIcon: FontAwesomeIcons.book,
                            labelText: 'CPF',
                            controller: _cpfController,
                            enableSuggestions: true,
                            autocorrect: true,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(11),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          CustomField(
                            choosedIcon: FontAwesomeIcons.envelope,
                            controller: _emailController,
                            labelText: 'Email',
                            enableSuggestions: true,
                            autocorrect: true,
                            keyboardType: TextInputType.text,
                          ),
                          const SizedBox(
                            height: 70.0,
                          ),
                          CustomButton(
                            onTap: () async {
                              if (firstName.isEmpty ||
                                  lastName.isEmpty ||
                                  cpf.isEmpty ||
                                  email.isEmpty) {
                                showSnackBar(context,
                                    'Há campos vazios. Preencha-os e tente novamente.');
                              } else if (!isValidName(firstName)) {
                                showSnackBar(
                                    context, 'Nome digitado é inválido!');
                              } else if (!isValidName(lastName)) {
                                showSnackBar(
                                    context, 'Sobrenome digitado é inválido!');
                              } else if (!isValidCpfCnpj(cpf)) {
                                showSnackBar(
                                    context, 'CPF digitado é inválido!');
                              } else if (!isValidEmail(email)) {
                                if (context.mounted) {
                                  showSnackBar(
                                      context, 'Email digitado é inválido!');
                                }
                              } else if (!((await checkIfUserExistsOnDB(
                                  'users', firstName, lastName, cpf, email)))) {
                                if (context.mounted) {
                                  showSnackBar(context,
                                      'Não existe usuário cadastrado com estas informações. Tente novamente.');
                                }
                              } else {
                                if (context.mounted) {
                                  context
                                      .read<FirebaseAuthMethods>()
                                      .resetPassword(context, email);
                                }
                              }
                            },
                            text: 'Recuperação de Senha',
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
      );
}
