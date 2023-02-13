import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc_fisio_app/formatters/phoneNumberFormatter.dart';
import 'package:tcc_fisio_app/res/custom_colors.dart';
import 'package:tcc_fisio_app/services/firebase_auth_methods.dart';
import 'package:tcc_fisio_app/widgets/custom_back_button.dart';
import 'package:tcc_fisio_app/widgets/custom_signup_field.dart';

class SignUpScreen extends StatefulWidget {
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
                  child: Padding(
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
                            //FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(11),
                            //PhoneFormatter(),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, preencha o seu CPF';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _cpf = value;
                            });
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
                            //FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(9),
                            //PhoneFormatter(),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, preencha o seu CREFITO';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _crefito = value;
                            });
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, preencha o seu email';
                            } else if (!value.contains('@')) {
                              return 'Por favor, insira um email válido';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _email = value;
                            });
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, preencha o seu telefone';
                            }
                            return null;
                          },
                          inputFormatters: [
                            //FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(11),
                            //PhoneFormatter(),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _phone = value;
                            });
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, preencha o campo senha!';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _password = value;
                            });
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
                          },
                          validator: (value) => value != password
                              ? 'As senhas não correspondem!'
                              : null,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                          onPressed: signUpUser,
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            textStyle: MaterialStateProperty.all(
                              const TextStyle(color: Colors.white),
                            ),
                            minimumSize: MaterialStateProperty.all(
                              Size(MediaQuery.of(context).size.width / 2.5, 50),
                            ),
                          ),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
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

  String get cpf => _cpfController.text;

  String get crefito => _crefitoController.text;

  String get email => _emailController.text;

  String get tel => _telController.text;

  String get password => _passwordController.text;

  String get confirmPassword => _confirmPasswordController.text;
}
