import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:tcc_fisio_app/res/custom_colors.dart';
import 'package:tcc_fisio_app/widgets/custom_back_button.dart';
import 'package:tcc_fisio_app/widgets/custom_button.dart';
import 'package:tcc_fisio_app/widgets/custom_date_time_field.dart';
import 'package:tcc_fisio_app/widgets/custom_dropdown_menu.dart';
import 'package:tcc_fisio_app/widgets/custom_field.dart';

class ProfilePacientScreen extends StatefulWidget {
  static String routeName = '/patient-profile';
  const ProfilePacientScreen({Key? key}) : super(key: key);

  @override
  ProfilePacientScreenState createState() => ProfilePacientScreenState();
}

class ProfilePacientScreenState extends State<ProfilePacientScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController emergencyPersonController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController civilStatusController = TextEditingController();
  TextEditingController occupationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: CustomColors.appBackgroudColor,
        body: SafeArea(
          child: SingleChildScrollView(
            reverse: false,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  const CustomBackButton(),
                  const SizedBox(height: 50.0),
                  const Text(
                    "Cadastrar Paciente",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 80.0),
                  Padding(
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
                          controller: nameController,
                          enableSuggestions: true,
                          autocorrect: true,
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(height: 20.0),
                        BirthDateField(
                            choosedIcon: FontAwesomeIcons.cakeCandles,
                            labelText: 'Data de Nascimento',
                            controller: birthDateController,
                            enableSuggestions: true,
                            autocorrect: true,
                            keyboardType: TextInputType.datetime),
                        const SizedBox(height: 20.0),
                        CustomField(
                          choosedIcon: FontAwesomeIcons.book,
                          labelText: 'CPF',
                          controller: cpfController,
                          enableSuggestions: true,
                          autocorrect: true,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 20.0),
                        CustomField(
                          choosedIcon: FontAwesomeIcons.mapLocationDot,
                          controller: addressController,
                          labelText: 'Endereço',
                          enableSuggestions: true,
                          autocorrect: true,
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(height: 20.0),
                        CustomField(
                          choosedIcon: FontAwesomeIcons.phone,
                          controller: telController,
                          labelText: 'Telefone',
                          enableSuggestions: true,
                          autocorrect: true,
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 20.0),
                        CustomField(
                          choosedIcon: FontAwesomeIcons.triangleExclamation,
                          controller: emergencyPersonController,
                          labelText: 'Contato de Emergência',
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(height: 20.0),
                        CustomDropdown(
                          labelText: 'Estado Civil',
                          choosedIcon: FontAwesomeIcons.rectangleList,
                          items: const [
                            'Escolha uma Opção:',
                            'Solteiro(a)',
                            'Divorciado(a)',
                            'Casado(a)',
                            'Separado(a)',
                            'Viúvo(a)'
                          ],
                          //initialValue: 'Solteiro(a)',
                          controller: civilStatusController,
                        ),
                        const SizedBox(height: 20.0),
                        CustomField(
                          choosedIcon: FontAwesomeIcons.briefcase,
                          controller: occupationController,
                          labelText: 'Profissão/Atuação',
                          enableSuggestions: true,
                          autocorrect: true,
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        CustomButton(onTap: () {}, text: 'Salvar'),
                      ],
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
