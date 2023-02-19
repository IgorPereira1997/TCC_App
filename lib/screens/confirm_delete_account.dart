import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc_fisio_app/res/custom_colors.dart';
import 'package:tcc_fisio_app/services/firebase_auth_methods.dart';
import 'package:tcc_fisio_app/widgets/custom_back_button.dart';
import 'package:tcc_fisio_app/widgets/custom_button.dart';

class PhysioDeleteAccount extends StatefulWidget {
  static String routeName = '/physio-delete-account';

  const PhysioDeleteAccount({
    Key? key,
  }) : super(key: key);

  @override
  State<PhysioDeleteAccount> createState() => _PhysioDeleteAccountState();
}

class _PhysioDeleteAccountState extends State<PhysioDeleteAccount> {
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
                  const SizedBox(height: 100.0),
                  const Text(
                    "Deletar Conta",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 50,
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
                            'Email: ${user?.email}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 50.0),
                          const Text(
                            'Você tem certeza que deseja deletar sua conta? Todos os seus pacientes e seus dados serão apagados!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(
                            height: 70.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomButton(
                                onTap: () async {
                                  if (context.mounted) {
                                    Navigator.pop(context);
                                  }
                                },
                                choosenColor: Colors.blueGrey.shade600,
                                choosenFontWeight: FontWeight.w900,
                                text: 'Não, cancelar',
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomButton(
                                onTap: () async {
                                  context
                                      .read<FirebaseAuthMethods>()
                                      .deleteAccount(context);
                                },
                                choosenColor: Colors.red,
                                choosenFontWeight: FontWeight.w900,
                                text: 'Sim, deletar conta',
                              ),
                            ],
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
