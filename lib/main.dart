import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc_fisio_app/firebase_options.dart';
import 'package:tcc_fisio_app/screens/buscar_paciente_screen.dart';
import 'package:tcc_fisio_app/screens/change_email.dart';
import 'package:tcc_fisio_app/screens/change_password_screen.dart';
import 'package:tcc_fisio_app/screens/confirm_delete_account.dart';
import 'package:tcc_fisio_app/screens/home_app_screen.dart';
import 'package:tcc_fisio_app/screens/icf_pacient.dart';
import 'package:tcc_fisio_app/screens/main_screen.dart';
import 'package:tcc_fisio_app/screens/new_pacient_screen.dart';
import 'package:tcc_fisio_app/screens/physio_profile_screen.dart';
import 'package:tcc_fisio_app/screens/reset_password_screen.dart';
import 'package:tcc_fisio_app/screens/signup_screen.dart';
import 'package:tcc_fisio_app/services/firebase_auth_methods.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'TCC ITP Fisio',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const AuthWrapper(),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('pt', 'BR'), // Add the locale for Portuguese
            // Add any other locales you want to support
          ],
          routes: {
            HomeAppScreen.routeName: (context) => const HomeAppScreen(),
            MainScreen.routeName: (context) => MainScreen(),
            SignUpScreen.routeName: (context) => const SignUpScreen(),
            SearchPacientScreen.routeName: (context) =>
                const SearchPacientScreen(),
            ProfilePacientScreen.routeName: (context) =>
                const ProfilePacientScreen(),
            ResetPasswordScreen.routeName: (context) =>
                const ResetPasswordScreen(),
            PhysioProfileScreen.routeName: (context) =>
                const PhysioProfileScreen(),
            PhysioChangeEmailScreen.routeName: (context) =>
                const PhysioChangeEmailScreen(),
            PhysioChangePasswordScreen.routeName: (context) =>
                const PhysioChangePasswordScreen(),
            PhysioDeleteAccount.routeName: (context) =>
                const PhysioDeleteAccount(),
            CIFPatientScreen.routeName: (context) => const CIFPatientScreen(),
          },
        );
      }),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return MainScreen();
    }
    return const HomeAppScreen();
  }
}
