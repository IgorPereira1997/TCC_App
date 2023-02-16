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
import 'package:tcc_fisio_app/widgets/custom_signup_field.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = '/signup-physio';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  String _firstName = '';
  String _lastName = '';
  String _cpf = '';
  String _crefito = '';
  String _email = '';
  String _phone = '';
  String _password = '';
  String _confirmPassword = '';

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _cpfController = TextEditingController();
  final _crefitoController = TextEditingController();
  final _emailController = TextEditingController();
  final _telController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _cpfController.dispose();
    _crefitoController.dispose();
    _emailController.dispose();
    _telController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void signUpUser() async {
      context.read<FirebaseAuthMethods>().signUpWithEmail(
            email: email,
            password: password,
            context: context,
            cpf: cpf,
            crefito: crefito,
            firstName: firstName,
            lastName: lastName,
          );
    }

    return GestureDetector(
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
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: true,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, preencha o seu nome';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _firstName = value;
                            });
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        CustomField(
                          choosedIcon: FontAwesomeIcons.userDoctor,
                          labelText: 'Sobrenome',
                          controller: _lastNameController,
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: true,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, preencha o seu sobrenome';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _lastName = value;
                            });
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        CustomField(
                          choosedIcon: FontAwesomeIcons.book,
                          labelText: 'CPF',
                          controller: _cpfController,
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: true,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(11),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _cpf = value;
                            });
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        CustomField(
                          choosedIcon: FontAwesomeIcons.idBadge,
                          controller: _crefitoController,
                          labelText: 'CREFITO',
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: true,
                          keyboardType: TextInputType.text,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(12),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _crefito = value;
                            });
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        CustomField(
                          choosedIcon: FontAwesomeIcons.envelope,
                          controller: _emailController,
                          labelText: 'Email',
                          obscureText: false,
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
                        const SizedBox(height: 16.0),
                        CustomField(
                          choosedIcon: FontAwesomeIcons.phone,
                          controller: _telController,
                          labelText: 'Telefone',
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: true,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(11),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _phone = value;
                            });
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        CustomField(
                          choosedIcon: FontAwesomeIcons.key,
                          controller: _passwordController,
                          labelText: 'Senha',
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
                        const SizedBox(height: 16.0),
                        CustomField(
                          choosedIcon: FontAwesomeIcons.key,
                          controller: _confirmPasswordController,
                          labelText: 'Confirmar Senha',
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            setState(() {
                              _confirmPassword = value;
                            });
                            return null;
                          },
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
                                  'Há campos em branco. Preencha-os e tente novamente.');
                            } else if (!isValidName(firstName)) {
                              showSnackBar(
                                  context, 'Nome digitado é inválido!');
                            } else if (!isValidName(lastName)) {
                              showSnackBar(
                                  context, 'Sobrenome digitado é inválido!');
                            } else if (!isValidCpfCnpj(cpf)) {
                              showSnackBar(context, 'CPF digitado é inválido!');
                            } else if (await checkFieldValueExistsOnDB(
                                'users', 'cpf', cpf)) {
                              if (context.mounted) {
                                showSnackBar(context,
                                    'CPF já está cadastrado no sistema!');
                              }
                            } else if (!isValidCrefito(crefito)) {
                              if (context.mounted) {
                                showSnackBar(
                                    context, 'CREFITO digitado é inválido!');
                              }
                            } else if (await checkFieldValueExistsOnDB(
                                'users', 'crefito', crefito)) {
                              if (context.mounted) {
                                showSnackBar(context,
                                    'CREFITO digitado já está cadastrado no sistema!');
                              }
                            } else if (!isValidEmail(email)) {
                              if (context.mounted) {
                                showSnackBar(
                                    context, 'Email digitado é inválido!');
                              }
                            } else if (await isEmailRegistered(email)) {
                              if (context.mounted) {
                                showSnackBar(
                                    context, 'O Email já está cadastrado!');
                              }
                            } else if (!isValidPhone(tel)) {
                              if (context.mounted) {
                                showSnackBar(
                                    context, 'Telefone digitado é inválido!');
                              }
                            } else if (!isValidPassword(password)) {
                              if (context.mounted) {
                                showSnackBar(context,
                                    'Senha digitada deve conter:\n - Entre 8 e 16 caracteres e:\n  - Uma letra maiúscula\n  - Uma letra minúscula\n  - Um número\n  - Um caractere especial');
                              }
                            } else if (!(password == confirmPassword)) {
                              if (context.mounted) {
                                showSnackBar(context,
                                    'As senhas digitadas não correspondem!');
                              }
                            } else {
                              signUpUser();
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
    );
  }

  String get firstName => _firstNameController.text;

  String get lastName => _lastNameController.text;

  String get cpf => cleanCPF(_cpfController.text);

  String get crefito => _crefitoController.text;

  String get email => _emailController.text;

  String get tel => _telController.text;

  String get password => _passwordController.text;

  String get confirmPassword => _confirmPasswordController.text;
}
