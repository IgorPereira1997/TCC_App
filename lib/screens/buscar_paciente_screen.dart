import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcc_fisio_app/constants/test_list.dart';
import 'package:tcc_fisio_app/services/firebase_auth_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc_fisio_app/model/patient.dart';
import 'package:tcc_fisio_app/res/custom_colors.dart';
import 'package:tcc_fisio_app/widgets/custom_back_button.dart';
import 'package:tcc_fisio_app/widgets/custom_button.dart';
import 'package:tcc_fisio_app/widgets/custom_patient_info.dart';
import 'package:tcc_fisio_app/widgets/custom_signup_field.dart';
//import 'package:tcc_fisio_app/widgets/patient_info.dart';

class SearchPacientScreen extends StatefulWidget {
  const SearchPacientScreen({Key? key}) : super(key: key);

  @override
  State<SearchPacientScreen> createState() => _SearchPacientScreenState();
}

class _SearchPacientScreenState extends State<SearchPacientScreen> {
  List<PatientDetails> get patients =>
      testList.map((data) => PatientDetails.fromMap(data)).toList();

  List<PatientDetails> searchedUsers = [];

  _quaryUsers(String value) {
    setState(() {
      searchedUsers =
          patients.where((user) => user.name.contains(value)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColors.appBackgroudColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 100.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: _quaryUsers,
                decoration: const InputDecoration(
                  hintText: "Digite o nome do paciente aqui...",
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: searchedUsers.length,
                itemBuilder: (context, index) {
                  final user = searchedUsers[index];
                  return Column(children: [
                    const SizedBox(height: 10),
                    CustomPatientButton(
                        onTap: () {
                          print('cliked me!');
                        },
                        text: user.name),
                  ]);

                  /*return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  );*/
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
