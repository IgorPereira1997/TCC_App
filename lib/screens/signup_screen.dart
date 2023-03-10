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
import 'package:tcc_fisio_app/widgets/custom_field_password.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = '/signup-physio';
  SignUpScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _cpfController = TextEditingController();
  final _crefitoController = TextEditingController();
  final _emailController = TextEditingController();
  final _telController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String get firstName => _firstNameController.text;
  String get lastName => _lastNameController.text;
  String get cpf => cleanCPF(_cpfController.text);
  String get crefito => _crefitoController.text;
  String get email => _emailController.text;
  String get tel => _telController.text;
  String get password => _passwordController.text;
  String get confirmPassword => _confirmPasswordController.text;

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
                    const SizedBox(height: 20.0),
                    const Text(
                      "Cadastro",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 70.0),
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
                            ),
                            const SizedBox(height: 16.0),
                            CustomField(
                              choosedIcon: FontAwesomeIcons.userDoctor,
                              labelText: 'Sobrenome',
                              controller: _lastNameController,
                              enableSuggestions: true,
                              autocorrect: true,
                              keyboardType: TextInputType.text,
                            ),
                            const SizedBox(height: 16.0),
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
                            const SizedBox(height: 16.0),
                            CustomField(
                              choosedIcon: FontAwesomeIcons.idBadge,
                              controller: _crefitoController,
                              labelText: 'CREFITO',
                              enableSuggestions: true,
                              autocorrect: true,
                              keyboardType: TextInputType.text,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(12),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            CustomField(
                              choosedIcon: FontAwesomeIcons.envelope,
                              controller: _emailController,
                              labelText: 'Email',
                              enableSuggestions: true,
                              autocorrect: true,
                              keyboardType: TextInputType.text,
                            ),
                            const SizedBox(height: 16.0),
                            CustomField(
                              choosedIcon: FontAwesomeIcons.phone,
                              controller: _telController,
                              labelText: 'Telefone',
                              enableSuggestions: true,
                              autocorrect: true,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(11),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            CustomFieldPassword(
                              choosedIcon: FontAwesomeIcons.key,
                              controller: _passwordController,
                              labelText: 'Senha',
                              enableSuggestions: false,
                              autocorrect: false,
                              keyboardType: TextInputType.text,
                            ),
                            const SizedBox(height: 16.0),
                            CustomFieldPassword(
                              choosedIcon: FontAwesomeIcons.key,
                              controller: _confirmPasswordController,
                              labelText: 'Confirmar Senha',
                              enableSuggestions: false,
                              autocorrect: false,
                              keyboardType: TextInputType.text,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            CustomButton(
                              onTap: () async {
                                if (firstName.isEmpty ||
                                    lastName.isEmpty ||
                                    cpf.isEmpty ||
                                    crefito.isEmpty ||
                                    email.isEmpty ||
                                    tel.isEmpty ||
                                    password.isEmpty ||
                                    confirmPassword.isEmpty) {
                                  showSnackBar(context,
                                      'H?? campos em branco. Preencha-os e tente novamente.');
                                } else if (!isValidName(firstName)) {
                                  showSnackBar(
                                      context, 'Nome digitado ?? inv??lido!');
                                } else if (!isValidName(lastName)) {
                                  showSnackBar(context,
                                      'Sobrenome digitado ?? inv??lido!');
                                } else if (!isValidCpfCnpj(cpf)) {
                                  showSnackBar(
                                      context, 'CPF digitado ?? inv??lido!');
                                } else if (await checkFieldValueExistsOnDB(
                                    'users', 'cpf', cpf)) {
                                  if (context.mounted) {
                                    showSnackBar(context,
                                        'CPF j?? est?? cadastrado no sistema!');
                                  }
                                } else if (!isValidCrefito(crefito)) {
                                  if (context.mounted) {
                                    showSnackBar(context,
                                        'CREFITO digitado ?? inv??lido!');
                                  }
                                } else if (await checkFieldValueExistsOnDB(
                                    'users', 'crefito', crefito)) {
                                  if (context.mounted) {
                                    showSnackBar(context,
                                        'CREFITO digitado j?? est?? cadastrado no sistema!');
                                  }
                                } else if (!isValidEmail(email)) {
                                  if (context.mounted) {
                                    showSnackBar(
                                        context, 'Email digitado ?? inv??lido!');
                                  }
                                } else if (await isEmailRegistered(email)) {
                                  if (context.mounted) {
                                    showSnackBar(
                                        context, 'O Email j?? est?? cadastrado!');
                                  }
                                } else if (!isValidPhone(tel)) {
                                  if (context.mounted) {
                                    showSnackBar(context,
                                        'Telefone digitado ?? inv??lido!');
                                  }
                                } else if (!isValidPassword(password)) {
                                  if (context.mounted) {
                                    showSnackBar(context,
                                        'Senha digitada deve conter:\n - Entre 8 e 16 caracteres e:\n  - Uma letra mai??scula\n  - Uma letra min??scula\n  - Um n??mero\n  - Um caractere especial');
                                  }
                                } else if (!(password == confirmPassword)) {
                                  if (context.mounted) {
                                    showSnackBar(context,
                                        'As senhas digitadas n??o correspondem!');
                                  }
                                } else {
                                  if (context.mounted) {
                                    context
                                        .read<FirebaseAuthMethods>()
                                        .signUpWithEmail(
                                            email: email,
                                            password: password,
                                            context: context,
                                            cpf: cpf,
                                            crefito: crefito,
                                            firstName: firstName,
                                            lastName: lastName,
                                            phone: tel);
                                  }
                                }
                              },
                              text: 'Cadastrar',
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
