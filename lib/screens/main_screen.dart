import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcc_fisio_app/services/firebase_auth_methods.dart';
import 'package:tcc_fisio_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc_fisio_app/res/custom_colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;
    final fullName = user.displayName!.split(' ');
    return Scaffold(
      backgroundColor: CustomColors.appBackgroudColor,
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 50.0),
          const Text(
            "Bem vindo(a) !",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 100.0),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                            padding: EdgeInsets.all(16.0),
                            child: Icon(
                              FontAwesomeIcons.person,
                              size: 60,
                              color: CustomColors.firebaseGrey,
                            ),
                          ),
                        ),
                      ),
                const SizedBox(height: 16.0),
                if (!user.emailVerified && !user.isAnonymous)
                  CustomButton(
                    onTap: () {
                      context
                          .read<FirebaseAuthMethods>()
                          .sendEmailVerification(context);
                    },
                    text: 'Verify Email',
                  ),
                const SizedBox(height: 50.0),
                Text(
                  'Dr(a). ${fullName.first} ${fullName.last}',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
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
                    context.read<FirebaseAuthMethods>().signOut(context);
                  },
                  text: 'Sign Out',
                ),
                CustomButton(
                  onTap: () {
                    context.read<FirebaseAuthMethods>().deleteAccount(context);
                  },
                  text: 'Delete Account',
                ),
                const SizedBox(height: 16.0),
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
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Icon(FontAwesomeIcons.circleUser,
                                    size: 70), // <-- Icon
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
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Icon(FontAwesomeIcons.magnifyingGlass,
                                    size: 70), // <-- Icon
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
        ],
      )),
    );
  }
}
