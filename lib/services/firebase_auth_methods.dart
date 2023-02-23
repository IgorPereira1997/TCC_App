import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tcc_fisio_app/screens/home_app_screen.dart';
import 'package:tcc_fisio_app/screens/main_screen.dart';
import 'package:tcc_fisio_app/utils/show_snackbar.dart';
import 'dart:io';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);
  final _fireStore = FirebaseFirestore.instance;

  //Routes for every page used here

  // FOR EVERY FUNCTION HERE
  // POP THE ROUTE USING: Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);

  // GET USER DATA
  // using null check operator since this method should be called only
  // when the user is logged in
  User get user => _auth.currentUser!;

  // STATE PERSISTENCE STREAM
  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();
  // OTHER WAYS (depends on use case):
  // Stream get authState => FirebaseAuth.instance.userChanges();
  // Stream get authState => FirebaseAuth.instance.idTokenChanges();
  // KNOW MORE ABOUT THEM HERE: https://firebase.flutter.dev/docs/auth/start#auth-state

  // EMAIL SIGN UP
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required String cpf,
    required String firstName,
    required String lastName,
    required String crefito,
    required String phone,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (context.mounted) await sendEmailVerification(context);
      _fireStore.collection('users').doc(_auth.currentUser!.uid).set({
        'cpf': cpf,
        'crefito': crefito,
        'firstName': firstName,
        'lastName': lastName,
        'phone': phone,
        'created': Timestamp.now(),
      });
      if (context.mounted) {
        Navigator.pushNamed(context, HomeAppScreen.routeName);
      }
    } on FirebaseAuthException catch (e) {
      // if you want to display your own custom error message
      showSnackBar(
          context, e.message!); // Displaying the usual firebase error message
    }
  }

  // EMAIL LOGIN
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (!user.emailVerified) {
        if (context.mounted) {
          await sendEmailVerification(context);
        }
        // restrict access to certain things using provider
        // transition to another page instead of home screen
      } else {
        if (context.mounted) {
          Navigator.pushNamed(context, MainScreen.routeName);
        }
      }
    } on FirebaseAuthException {
      showSnackBar(
          context,
          'Credenciais de acesso inválidas. Verifique a caixa de entrada do seu email para validá-lo ou, caso não seja o caso, crie uma nova conta.',
          7); // Displaying the usual firebase error message e.message!

      //showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  // EMAIL VERIFICATION
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Verificação de email enviada!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Display error message
    }
  }

  // SIGN OUT
  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
            context, HomeAppScreen.routeName, (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  // DELETE ACCOUNT
  Future<void> deleteAccount(BuildContext context) async {
    try {
      _fireStore.collection('users').doc(_auth.currentUser!.uid).delete();
      await _auth.currentUser!.delete();
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
            context, HomeAppScreen.routeName, (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
      // if an error of requires-recent-login is thrown, make sure to log
      // in user again and then delete account.
    }
  }

  //RESET PASSWORD
  Future<void> resetPassword(
    BuildContext context,
    String email,
  ) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
            context, HomeAppScreen.routeName, (route) => false);

        showSnackBar(
            context, 'Foi enviado um email para recuperação da senha.');
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
      // if an error of requires-recent-login is thrown, make sure to log
      // in user again and then delete account.
    }
  }
}

//UPDATE USER (FIRESTORE)

Future<void> updateUserDataFS({
  required String firstName,
  required String lastName,
  required String phone,
  required BuildContext context,
}) async {
  try {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'firstName': firstName,
      'lastName': lastName,
      //'active': false,
      'phone': phone,
      'updated_at': Timestamp.now(),
    });
  } on FirebaseAuthException catch (e) {
    // if you want to display your own custom error message
    showSnackBar(
        context, e.message!); // Displaying the usual firebase error message
  }
}

//CHECK USER PASSWORD
Future<bool> checkUserPassword(String password) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw FirebaseAuthException(
          code: "user-not-found", message: "User not found");
    }
    AuthCredential credential =
        EmailAuthProvider.credential(email: user.email!, password: password);
    await user.reauthenticateWithCredential(credential);
    return true;
  } on FirebaseAuthException catch (e) {
    // Handle any errors that may occur
    if (e.code == 'wrong-password') {
      return false;
    }
    throw FirebaseAuthException(code: e.code, message: e.message);
  } catch (e) {
    // Handle any other errors that may occur
    return Future.error(e);
  }
}

//UPDATE EMAIL AFTER VERIFICAITON

Future<void> updateYourEmail(
    {required String email, required BuildContext context}) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw FirebaseAuthException(
          code: "user-not-found", message: "User not found");
    } else {
      user.updateEmail(email);
      await FirebaseAuth.instance.signOut();
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
            context, HomeAppScreen.routeName, (route) => false);
        showSnackBar(
            context, 'Email modificado com sucesso. Faça login novamente.');
      }
    }
  } on FirebaseAuthException catch (e) {
    // if you want to display your own custom error message
    showSnackBar(
        context, e.message!); // Displaying the usual firebase error message
  }
}

Future<void> uploadImageT(BuildContext context) async {
  try {
    final connection = FirebaseStorage.instance
        .refFromURL("gs://tcc-igor-fisioapp.appspot.com");
    if (kIsWeb) {}
    final testUpload = connection.list();
    if (connection.name.isEmpty && context.mounted) {
      showSnackBar(context, 'Consegui conectar, ${testUpload.hashCode}');
    }
  } on FirebaseException catch (e) {
    if (context.mounted) {
      showSnackBar(context, 'Error reported: ${e.toString()}');
    }
  }
}

Future<void> uploadImage(BuildContext context, File image) async {
  final FirebaseStorage storage = FirebaseStorage.instance;
  // Create a reference to the file you want to upload
  final user = FirebaseAuth.instance.currentUser!;
  String fileName = DateTime.now().millisecondsSinceEpoch.toString();

  try {
    // Clean folder up
    await deleteFolder(path: '${user.uid}/profileImage');
    //await delRef.delete();
  } catch (e) {
    if (context.mounted) {
      showSnackBar(context, 'Error deleting folder: $e');
    }
  }

  Reference ref = storage.ref().child('${user.uid}/profileImage/$fileName.jpg');

  try {
    // Upload the file to Firebase Storage
    await ref.putFile(image);

    // Get the download URL for the uploaded file
    final downloadURL = await ref.getDownloadURL();
    print('File uploaded to Firebase Storage. Download URL: $downloadURL');

    user.updatePhotoURL(downloadURL);
    if (context.mounted) {
      showSnackBar(context, 'Imagem atualizada com sucesso!');
    }
  } catch (e) {
    if (context.mounted) {
      showSnackBar(context, 'Error uploading file: $e');
    }
  }
}

Future<void> deleteFolder({required String path}) async {
  List<String> paths = [];
  paths = await _deleteFolder(path, paths);
  for (String path in paths) {
    await FirebaseStorage.instance.ref().child(path).delete();
  }
}

Future<List<String>> _deleteFolder(String folder, List<String> paths) async {
  ListResult list =
      await FirebaseStorage.instance.ref().child(folder).listAll();
  List<Reference> items = list.items;
  List<Reference> prefixes = list.prefixes;
  for (Reference item in items) {
    paths.add(item.fullPath);
  }
  for (Reference subfolder in prefixes) {
    paths = await _deleteFolder(subfolder.fullPath, paths);
  }
  return paths;
}
