import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc_fisio_app/res/custom_colors.dart';
import 'package:tcc_fisio_app/res/custom_functions.dart';
import 'package:tcc_fisio_app/screens/home_app_screen.dart';
import 'package:tcc_fisio_app/screens/physio_profile_screen.dart';
import 'package:tcc_fisio_app/services/firebase_auth_methods.dart';
import 'package:tcc_fisio_app/utils/show_snackbar.dart';
import 'package:tcc_fisio_app/widgets/custom_back_button.dart';
import 'package:tcc_fisio_app/widgets/custom_button.dart';
import 'package:tcc_fisio_app/widgets/custom_signup_field.dart';

class PhysioChangeEmailScreen extends StatefulWidget {
  static String routeName = '/physio-change-email';

  const PhysioChangeEmailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PhysioChangeEmailScreen> createState() =>
      _PhysioChangeEmailScreenState();
}

class _PhysioChangeEmailScreenState extends State<PhysioChangeEmailScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _email; // ignore: unused_field
  String? _password; // ignore: unused_field

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                    "Alterar/Atualizar Email",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 35,
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
                          const SizedBox(height: 16.0),
                          Text(
                            'Email Atual: ${user?.email}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 50.0),
                          CustomField(
                            choosedIcon: FontAwesomeIcons.envelope,
                            controller: _emailController,
                            labelText: 'Novo Email',
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
                          const SizedBox(height: 25.0),
                          CustomField(
                            choosedIcon: FontAwesomeIcons.key,
                            controller: _passwordController,
                            labelText:
                                'Digite a senha para confirmar a operação',
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
                              _formKey.currentState!.validate();
                              _formKey.currentState!.save();
                              if (await isEmailRegistered(email)) {
                                if (context.mounted) {
                                  showSnackBar(context,
                                      'Email digitado já está cadastrado no sistema!');
                                }
                              } else if (!(await checkUserPassword(password))) {
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
                                      'Foi enviada uma verificação no email atual para confirmar a mudança.');
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

  String get email => _emailController.text;

  String get password => _passwordController.text;
}
