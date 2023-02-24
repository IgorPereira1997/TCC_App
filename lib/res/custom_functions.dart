import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';

Future<bool> checkFieldValueExistsOnDB(
    collectionChosen, fieldChosen, valueChosen) async {
  final HttpsCallable checkFieldValueExistsCallable =
      FirebaseFunctions.instance.httpsCallable('checkFieldValueExists');
  final result = await checkFieldValueExistsCallable.call({
    'collectionPath': collectionChosen,
    'fieldName': fieldChosen,
    'value': valueChosen,
  });

  if (result.data) {
    return true;
  }
  return false;
}

Future<bool> checkIfUserExistsOnDB(
    collection, firstName, lastName, cpf, email) async {
  final HttpsCallable checkUserExistsCallable =
      FirebaseFunctions.instance.httpsCallable('checkUserExists');
  final result = await checkUserExistsCallable.call({
    'collectionPath': collection,
    'cpf': cpf,
    'email': email,
    'firstName': firstName,
    'lastName': lastName
  });

  final userExists = result.data;

  return userExists;
}

Future<Map<String, dynamic>?> fetchData(user) async {
  // Create a reference to a Firestore document
  DocumentReference docRef =
      FirebaseFirestore.instance.collection('users').doc(user.uid);

  // Fetch the document data
  DocumentSnapshot snapshot = await docRef.get();

  // Return the data as a Map<String, dynamic> or null if it doesn't exist
  return snapshot.data() as Map<String, dynamic>?;
}

bool isValidCpfCnpj(String value) {
  // Remove any non-digit characters from the input
  value = value.replaceAll(RegExp(r'[^0-9]'), '');

  if (value.length == 11) {
    // CPF validation
    List<int> digits = value.split('').map(int.parse).toList();
    int d1 = 0, d2 = 0;

    for (int i = 0; i < 9; i++) {
      d1 += digits[i] * (10 - i);
      d2 += digits[i] * (11 - i);
    }

    d1 = (d1 * 10) % 11;
    d2 = ((d2 + (2 * d1)) * 10) % 11;

    return (d1 == digits[9]) && (d2 == digits[10]);
  } else if (value.length == 14) {
    // CNPJ validation
    List<int> digits = value.split('').map(int.parse).toList();
    int d1 = 0, d2 = 0;

    for (int i = 0; i < 12; i++) {
      int index = i < 4 ? i + 8 : i - 4;
      d1 += digits[index] * (i + 2);
      d2 += digits[index] * (i + 3);
    }

    d1 = (d1 % 11 < 2) ? 0 : 11 - (d1 % 11);
    d2 = (d2 % 11 < 2) ? 0 : 11 - (d2 % 11);

    return (d1 == digits[12]) && (d2 == digits[13]);
  }

  return false; // Invalid input length
}

bool isValidEmail(String email) {
  final emailRegExp =
      RegExp(r"^((?!\.)[\w-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])$");
  return emailRegExp.hasMatch(email);
}

bool isValidName(String name) {
  final nameRegExp =
      RegExp(r"^([\u00C0-\u017Fa-zA-Z]{2,}(?:[-]?[\u00C0-\u017Fa-zA-Z]{2,}))$");
  return nameRegExp.hasMatch(name);
}

bool isValidPassword(String password) {
  final passwordRegExp =
      RegExp(r'^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[^\w\d\s:])([^\s]){8,16}$');
  return passwordRegExp.hasMatch(password);
}

bool isValidPhone(String phone) {
  final phoneRegExp = RegExp(r"^(\(?[0-9]{2}\)?)? ?([0-9]{4,5})-?([0-9]{4})$");
  return phoneRegExp.hasMatch(phone);
}

bool isValidCrefito(String crefito) {
  final crefitoRegExp = RegExp(r'^\d{6}-(F|TA)$');
  return crefitoRegExp.hasMatch(crefito);
}

Future<bool> isEmailRegistered(String email) async {
  try {
    // Call the Firebase Authentication API to check if the email is registered
    List<String> signInMethods =
        await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

    // If the signInMethods list is not empty, it means the email is already registered
    return signInMethods.isNotEmpty;
  } on FirebaseAuthException catch (e) {
    // Handle any errors that may occur
    throw FirebaseAuthException(code: e.code, message: e.message);
  } catch (e) {
    // Handle any other errors that may occur
    return Future.error(e);
  }
}

Future<bool> isCpfRegistered(String cpf) async {
  try {
    // Call the Firestore collection to check if the given cpf is already registered
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('cpf', isEqualTo: cpf)
        .limit(1)
        .get();

    // If the query snapshot contains any documents, it means the cpf is already registered
    return querySnapshot.docs.isNotEmpty;
  } catch (e) {
    // Handle any errors that may occur
    return Future.error('Error: $e');
  }
}

Future<bool> isCrefitoRegistered(String crefito) async {
  try {
    // Call the Firestore collection to check if the given crefito is already registered
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('crefito', isEqualTo: crefito)
        .limit(1)
        .get();

    // If the query snapshot contains any documents, it means the crefito is already registered
    return querySnapshot.docs.isNotEmpty;
  } catch (e) {
    // Handle any errors that may occur
    return Future.error('Error: $e');
  }
}

String cleanCPF(String cpf) {
  return cpf.replaceAll(RegExp(r'[^0-9]'), '');
}

String cleanPhone(String phone) {
  return phone.replaceAll(RegExp(r'[^0-9]'), '');
}
