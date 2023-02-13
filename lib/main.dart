import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc_fisio_app/firebase_options.dart';
import 'package:tcc_fisio_app/screens/buscar_paciente_screen.dart';
import 'package:tcc_fisio_app/screens/home_app_screen.dart';
import 'package:tcc_fisio_app/screens/main_screen.dart';
import 'package:tcc_fisio_app/screens/home_screen.dart';
import 'package:tcc_fisio_app/screens/login_email_password_screen.dart';
import 'package:tcc_fisio_app/screens/login_screen.dart';
import 'package:tcc_fisio_app/screens/new_pacient_screen.dart';
import 'package:tcc_fisio_app/screens/phone_screen.dart';
import 'package:tcc_fisio_app/screens/profile_screen.dart';
import 'package:tcc_fisio_app/screens/signup_email_password_screen.dart';
import 'package:tcc_fisio_app/screens/signup_screen.dart';
import 'package:tcc_fisio_app/services/firebase_auth_methods.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await FacebookAuth.i.webAndDesktopInitialize(
        appId: "2069509059913430", cookie: true, xfbml: true, version: "v15.0");
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FirebaseAuthMethods>().authState,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        title: 'TCC ITP Fisio',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthWrapper(),
        routes: {
          EmailPasswordSignup.routeName: (context) =>
              const EmailPasswordSignup(),
          EmailPasswordLogin.routeName: (context) => const EmailPasswordLogin(),
          PhoneScreen.routeName: (context) => const PhoneScreen(),
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      //return SearchPacientScreen();
      //return const ProfilePacientScreen();
      //return const ProfileScreen();
      //return const SignUpScreen();
      return const MainScreen();
      //return const HomeAppScreen();
    }
    //return const LoginScreen();
    return const HomeAppScreen();
  }
}
