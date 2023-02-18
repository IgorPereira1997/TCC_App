import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcc_fisio_app/res/custom_functions.dart';
import 'package:tcc_fisio_app/screens/buscar_paciente_screen.dart';
import 'package:tcc_fisio_app/screens/new_pacient_screen.dart';
import 'package:tcc_fisio_app/screens/physio_profile_screen.dart';
import 'package:tcc_fisio_app/services/firebase_auth_methods.dart';
import 'package:tcc_fisio_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc_fisio_app/res/custom_colors.dart';

class MainScreen extends StatelessWidget {
  static String routeName = '/main';
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100.0),
                  const Text(
                    "Bem vindo(a) !",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50.0),
                  user.photoURL != null
                      ? ClipOval(
                          child: Material(
                            color: CustomColors.firebaseGrey.withOpacity(0.3),
                            child: Image.network(
                              user.photoURL!,
                              fit: BoxFit.fitHeight,
                              height: 150.0,
                              width: 150.0,
                            ),
                          ),
                        )
                      : ClipOval(
                          child: Material(
                            color: CustomColors.firebaseGrey.withOpacity(0.3),
                            child: const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Icon(
                                FontAwesomeIcons.person,
                                size: 60,
                                color: CustomColors.firebaseGrey,
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(height: 50.0),
                  FutureBuilder<Map<String, dynamic>?>(
                    future: fetchData(user),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final userData = snapshot.data!;
                        return Text(
                          "Dr(a). ${userData['firstName']} ${userData['lastName']}",
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Email: ${user.email!}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  CustomButton(
                      onTap: () {
                        if (context.mounted) {
                          Navigator.pushNamed(
                              context, PhysioProfileScreen.routeName);
                        }
                      },
                      text: 'Ver Perfil'),
                  CustomButton(
                    onTap: () {
                      context.read<FirebaseAuthMethods>().signOut(context);
                    },
                    text: 'Sair',
                  ),
                  /*CustomButton(
                    onTap: () {
                      context
                          .read<FirebaseAuthMethods>()
                          .deleteAccount(context);
                    },
                    text: 'Deletar Conta',
                  ),*/
                  const SizedBox(height: 50.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Material(
                            color: Colors.white,
                            child: InkWell(
                              splashColor: Colors.green,
                              onTap: () {
                                if (context.mounted) {
                                  Navigator.pushNamed(
                                      context, ProfilePacientScreen.routeName);
                                }
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Icon(FontAwesomeIcons.circleUser,
                                      size: 50), // <-- Icon
                                  SizedBox(height: 5),
                                  Text(
                                    "Cadastrar\nPaciente",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Material(
                            color: Colors.white,
                            child: InkWell(
                              splashColor: Colors.green,
                              // Within the `FirstRoute` widget
                              onTap: () {
                                if (context.mounted) {
                                  Navigator.pushNamed(
                                      context, SearchPacientScreen.routeName);
                                }
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Icon(FontAwesomeIcons.magnifyingGlass,
                                      size: 50), // <-- Icon
                                  SizedBox(height: 5),
                                  Text(
                                    "Buscar\nPaciente",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
