import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:tcc_fisio_app/res/custom_colors.dart';
import 'package:tcc_fisio_app/res/custom_functions.dart';
import 'package:tcc_fisio_app/screens/change_email.dart';
import 'package:tcc_fisio_app/services/firebase_auth_methods.dart';
import 'package:tcc_fisio_app/utils/show_snackbar.dart';
import 'package:tcc_fisio_app/widgets/custom_back_button.dart';
import 'package:tcc_fisio_app/widgets/custom_button.dart';
import 'package:tcc_fisio_app/widgets/custom_signup_field.dart';

class PhysioProfileScreen extends StatefulWidget {
  static String routeName = '/physio-check-profile';

  const PhysioProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PhysioProfileScreen> createState() => _PhysioProfileScreenState();
}

class _PhysioProfileScreenState extends State<PhysioProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late final Stream<DocumentSnapshot> _dataStream;
  Map<String, dynamic> data = {};

  String? firstName;
  String? lastName;
  String? cpf;
  String? crefito;
  String? phone;

  @override
  void initState() {
    super.initState();
    _dataStream = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
    _dataStream.listen(
      (DocumentSnapshot snapshot) {
        if (mounted && snapshot.exists) {
          data = snapshot.data() as Map<String, dynamic>;
          setState(() {
            firstName = data['firstName'];
            lastName = data['lastName'];
            cpf = data['cpf'];
            crefito = data['crefito'];
            phone = data['phone'];
          });
        }
      },
      onDone: () {
        _dataStream.drain();
        //_dataStream.close();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _dataStream.drain();
  }

  @override
  Widget build(BuildContext context) {
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
                  const SizedBox(height: 20.0),
                  const Text(
                    "Editar Perfil",
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
                      child: StreamBuilder<DocumentSnapshot>(
                        stream: _dataStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomField(
                                  choosedIcon: FontAwesomeIcons.userDoctor,
                                  labelText: 'Nome',
                                  obscureText: false,
                                  enableSuggestions: true,
                                  autocorrect: true,
                                  initialValue: data['firstName'],
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (!isValidName(value!)) {
                                      showSnackBar(
                                          context, 'Nome digitado é inválido!');
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    if (mounted) {
                                      setState(() {
                                        firstName = value;
                                      });
                                    }

                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16.0),
                                CustomField(
                                  choosedIcon: FontAwesomeIcons.userDoctor,
                                  labelText: 'Sobrenome',
                                  initialValue: data['lastName'],
                                  obscureText: false,
                                  enableSuggestions: true,
                                  autocorrect: true,
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (!isValidName(value!)) {
                                      showSnackBar(context,
                                          'Sobrenome digitado é inválido!');
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    if (mounted) {
                                      setState(() {
                                        lastName = value;
                                      });
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16.0),
                                CustomField(
                                  choosedIcon: FontAwesomeIcons.book,
                                  labelText: 'CPF',
                                  initialValue: data['cpf'],
                                  obscureText: false,
                                  enableSuggestions: true,
                                  readOnly: true,
                                  autocorrect: true,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(11),
                                  ],
                                  onChanged: (value) {
                                    if (mounted) {
                                      setState(() {
                                        cpf = value;
                                      });
                                    }
                                    return null;
                                  },
                                  onTap: () {
                                    showSnackBar(context,
                                        'O campo CPF não pode ser alterado após a criação do perfil.');
                                  },
                                ),
                                const SizedBox(height: 16.0),
                                CustomField(
                                  choosedIcon: FontAwesomeIcons.idBadge,
                                  labelText: 'CREFITO',
                                  initialValue: data['crefito'],
                                  obscureText: false,
                                  enableSuggestions: true,
                                  autocorrect: true,
                                  readOnly: true,
                                  keyboardType: TextInputType.text,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(12),
                                  ],
                                  onChanged: (value) {
                                    if (mounted) {
                                      setState(() {
                                        crefito = value;
                                      });
                                    }
                                    return null;
                                  },
                                  onTap: () {
                                    showSnackBar(context,
                                        'O campo CREFITO não pode ser alterado após a criação do perfil.');
                                  },
                                ),
                                const SizedBox(height: 16.0),
                                CustomField(
                                  choosedIcon: FontAwesomeIcons.phone,
                                  labelText: 'Telefone',
                                  initialValue: data['phone'],
                                  obscureText: false,
                                  enableSuggestions: true,
                                  autocorrect: true,
                                  autoValidate: AutovalidateMode.disabled,
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(11),
                                  ],
                                  onChanged: (value) {
                                    if (mounted) {
                                      setState(() {
                                        phone = value;
                                      });
                                    }
                                    return null;
                                  },
                                  validator: (value) {
                                    if (!isValidPhone(value!)) {
                                      showSnackBar(context,
                                          'Telefone digitado é inválido!');
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                CustomButton(
                                  onTap: () {
                                    _formKey.currentState!.validate();
                                    _formKey.currentState!.save();
                                    if (isValidName(firstName!) &&
                                        isValidName(lastName!) &&
                                        isValidPhone(phone!)) {
                                      updateUserDataFS(
                                          firstName: firstName!,
                                          lastName: lastName!,
                                          phone: cleanPhone(phone!),
                                          context: context);
                                      showSnackBar(context,
                                          'Dados atualizados com sucesso!');
                                    }
                                  },
                                  text: 'Atualizar Perfil',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomButton(
                                    onTap: () {
                                      if (context.mounted) {
                                        Navigator.pushNamed(context,
                                            PhysioChangeEmailScreen.routeName);
                                      }
                                    },
                                    text: 'Alterar Email'),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomButton(onTap: () {}, text: 'Mudar Senha'),
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return Text("Error: ${snapshot.error}");
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
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
}
