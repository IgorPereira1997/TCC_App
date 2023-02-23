import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tcc_fisio_app/res/custom_colors.dart';
import 'package:tcc_fisio_app/res/custom_functions.dart';
import 'package:tcc_fisio_app/screens/change_email.dart';
import 'package:tcc_fisio_app/screens/change_password_screen.dart';
import 'package:tcc_fisio_app/screens/confirm_delete_account.dart';
import 'package:tcc_fisio_app/services/firebase_auth_methods.dart';
import 'package:tcc_fisio_app/utils/show_snackbar.dart';
import 'package:tcc_fisio_app/widgets/custom_back_button.dart';
import 'package:tcc_fisio_app/widgets/custom_button.dart';
import 'package:tcc_fisio_app/widgets/custom_field.dart';

class PhysioProfileScreen extends StatefulWidget {
  static String routeName = '/physio-check-profile';

  const PhysioProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PhysioProfileScreen> createState() => PhysioProfileScreenState();
}

class PhysioProfileScreenState extends State<PhysioProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late final Stream<DocumentSnapshot> _dataStream;
  late final StreamController<DocumentSnapshot> _dataController =
      StreamController<DocumentSnapshot>.broadcast();

  late final Stream<User?> _userStream;
  late final StreamController<User?> _userController =
      StreamController<User?>.broadcast();

  late final User user;

  late Map<String, dynamic> data = {};

  File? _image;

  late final TextEditingController _firstNameController =
      TextEditingController();
  late final TextEditingController _lastNameController =
      TextEditingController();
  late final TextEditingController _cpfController = TextEditingController();
  late final TextEditingController _crefitoController = TextEditingController();
  late final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser!;

    _dataStream = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
    _dataStream.listen((DocumentSnapshot snapshot) {
      if (mounted && snapshot.exists) {
        data = snapshot.data() as Map<String, dynamic>;
        _dataController.add(snapshot);
        _firstNameController.text = data["firstName"];
        _lastNameController.text = data["lastName"];
        _cpfController.text = data['cpf'];
        _crefitoController.text = data["crefito"];
        _phoneController.text = data["phone"];
      }
    });

    _userStream = FirebaseAuth.instance.userChanges();
    _userStream.listen((User? user) {
      if (user != null) {
        _userController.add(user);
      }

      user = FirebaseAuth.instance.currentUser!;
    });
  }

  Future<void> _pickImage(ImageSource source) async {
    PermissionStatus permission;

    if (kIsWeb) {
      permission = PermissionStatus.granted;
    } else {
      if (source == ImageSource.camera) {
        permission = await Permission.camera.request();
        if (permission != PermissionStatus.granted) {
          // If permission is not granted, show usage description and request again
          permission = await Permission.camera.request();
          if (permission != PermissionStatus.granted) {
            // If permission is still not granted, show snackbar with error message
            if (context.mounted) {
              showSnackBar(context, 'Camera permission denied');
            }
          }
        }
      } else if (source == ImageSource.gallery) {
        permission = await Permission.photos.request();
        if (permission != PermissionStatus.granted) {
          // If permission is not granted, show usage description and request again
          permission = await Permission.photos.request();
          if (permission != PermissionStatus.granted) {
            // If permission is still not granted, show snackbar with error message
            if (context.mounted) {
              showSnackBar(context, 'Photo library permission denied');
            }
          }
        }
      } else {
        permission = await Permission.storage.request();
        if (permission != PermissionStatus.granted) {
          // If permission is not granted, show usage description and request again
          permission = await Permission.storage.request();
          if (permission != PermissionStatus.granted) {
            // If permission is still not granted, show snackbar with error message
            if (context.mounted) {
              showSnackBar(context, 'Photo library permission denied');
            }
          }
        }
      }
    }

    if (permission == PermissionStatus.granted) {
      // Use the image_picker package to select an image from the user's device
      final picker = ImagePicker();

      try {
        final pickedFile = await picker.pickImage(source: source);
        if (pickedFile != null) {
          if (context.mounted) {
            uploadImage(context, File(pickedFile.path));
          }
        }
      } catch (e) {
        if (context.mounted) {
          showSnackBar(context, 'Error on pickImage, reported as: $e');
        }
      }
    } else {
      if (context.mounted) {
        showSnackBar(context, 'Permission Denied');
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _dataStream.drain();
    _userStream.drain();
  }

  String get firstName => _firstNameController.text;

  String get lastName => _lastNameController.text;

  String get cpf => cleanCPF(_cpfController.text);

  String get crefito => _crefitoController.text;

  String get phone => _phoneController.text;

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
              reverse: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Email: ${user.email}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  const Text(
                    'Para alterar a foto do perfil, clique em uma das opções abaixo da foto.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  StreamBuilder<User?>(
                      stream: _userController.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        }
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Column(
                            children: [
                              snapshot.data!.photoURL != null
                                  ? ClipOval(
                                      child: Material(
                                        color: CustomColors.firebaseGrey
                                            .withOpacity(0.3),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Image.network(
                                            snapshot.data!.photoURL!,
                                            fit: BoxFit.fitHeight,
                                            height: 200.0,
                                            width: 200.0,
                                          ),
                                        ),
                                      ),
                                    )
                                  : ClipOval(
                                      child: Material(
                                        color: CustomColors.firebaseGrey
                                            .withOpacity(0.3),
                                        child: InkWell(
                                          onTap: () {},
                                          child: const Padding(
                                            padding: EdgeInsets.all(20.0),
                                            child: Icon(
                                              FontAwesomeIcons.person,
                                              size: 100,
                                              color: CustomColors.firebaseGrey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                              const SizedBox(height: 16.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomButton(
                                      onTap: () async {
                                        await _pickImage(ImageSource.camera);
                                        try {
                                          await FirebaseAuth
                                              .instance.currentUser
                                              ?.reload();
                                          _userController.add(FirebaseAuth
                                              .instance.currentUser);
                                        } catch (e) {
                                          if (context.mounted) {
                                            showSnackBar(context,
                                                "An error occurred: ${e.toString()}");
                                          }
                                        }
                                      },
                                      text: 'Tire uma Foto'),
                                  CustomButton(
                                      onTap: () async {
                                        await _pickImage(ImageSource.gallery);
                                        try {
                                          await FirebaseAuth
                                              .instance.currentUser
                                              ?.reload();
                                          _userController.add(FirebaseAuth
                                              .instance.currentUser);
                                        } catch (e) {
                                          if (context.mounted) {
                                            showSnackBar(context,
                                                "An error occurred: ${e.toString()}");
                                          }
                                        }
                                      },
                                      text: 'Selecione uma Foto'),
                                  if (kIsWeb)
                                    CustomButton(
                                        onTap: () async {
                                          FilePickerResult? result =
                                              await FilePicker.platform
                                                  .pickFiles(
                                                      type: FileType.image);

                                          if (result != null) {
                                            _image =
                                                File(result.files.single.path!);
                                            if (context.mounted) {
                                              await uploadImage(
                                                  context, _image!);
                                            }
                                            try {
                                              await FirebaseAuth
                                                  .instance.currentUser
                                                  ?.reload();
                                              _userController.add(FirebaseAuth
                                                  .instance.currentUser);
                                            } catch (e) {
                                              if (context.mounted) {
                                                showSnackBar(context,
                                                    "An error occurred: ${e.toString()}");
                                              }
                                            }
                                          } else {
                                            if (context.mounted) {
                                              showSnackBar(context,
                                                  'Image upload canceled.');
                                            } // User canceled the picker
                                          }
                                        },
                                        text: 'Upload')
                                ],
                              ),
                            ],
                          );
                        }
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Para alterar os dados que permitirem modoficação,\ndigite o(s) novo(s) valor(res) e depois \nclique em "Atualizar Perfil"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  StreamBuilder<DocumentSnapshot>(
                      stream: _dataController.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Form(
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
                                  CustomField(
                                    choosedIcon: FontAwesomeIcons.userDoctor,
                                    labelText: 'Nome',
                                    enableSuggestions: true,
                                    autocorrect: true,
                                    initialValue: snapshot.data!['firstName'],
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (!isValidName(value!)) {
                                        showSnackBar(context,
                                            'Nome digitado é inválido!');
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      _firstNameController.text = value;
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 16.0),
                                  CustomField(
                                    choosedIcon: FontAwesomeIcons.userDoctor,
                                    labelText: 'Sobrenome',
                                    initialValue: snapshot.data!['lastName'],
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
                                      _lastNameController.text = value;
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 16.0),
                                  CustomField(
                                    choosedIcon: FontAwesomeIcons.book,
                                    labelText: 'CPF',
                                    initialValue: snapshot.data!['cpf'],
                                    enableSuggestions: true,
                                    readOnly: true,
                                    autocorrect: true,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(11),
                                    ],
                                    onTap: () {
                                      showSnackBar(context,
                                          'O campo CPF não pode ser alterado após a criação do perfil.');
                                    },
                                  ),
                                  const SizedBox(height: 16.0),
                                  CustomField(
                                    choosedIcon: FontAwesomeIcons.idBadge,
                                    labelText: 'CREFITO',
                                    initialValue: snapshot.data!['crefito'],
                                    enableSuggestions: true,
                                    autocorrect: true,
                                    readOnly: true,
                                    keyboardType: TextInputType.text,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(12),
                                    ],
                                    onTap: () {
                                      showSnackBar(context,
                                          'O campo CREFITO não pode ser alterado após a criação do perfil.');
                                    },
                                  ),
                                  const SizedBox(height: 16.0),
                                  CustomField(
                                    choosedIcon: FontAwesomeIcons.phone,
                                    labelText: 'Telefone',
                                    initialValue: snapshot.data!['phone'],
                                    enableSuggestions: true,
                                    autocorrect: true,
                                    autoValidate: AutovalidateMode.disabled,
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(11),
                                    ],
                                    onChanged: (value) {
                                      _phoneController.text = value;
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
                                    onTap: () async {
                                      if (firstName.isEmpty) {
                                        if (context.mounted) {
                                          showSnackBar(context,
                                              'O campo Nome não pode ser vazio. Por favor, tente novamente.');
                                        }
                                      } else if (lastName.isEmpty) {
                                        if (context.mounted) {
                                          showSnackBar(context,
                                              'O campo Sobrenome não pode ser vazio. Por favor, tente novamente.');
                                        }
                                      } else if (phone.isEmpty) {
                                        if (context.mounted) {
                                          showSnackBar(context,
                                              'O campo Telefone não pode ser vazio. Por favor, tente novamente.');
                                        }
                                      } else if (isValidName(
                                              _firstNameController.text) &&
                                          isValidName(
                                              _lastNameController.text) &&
                                          isValidPhone(_phoneController.text)) {
                                        await updateUserDataFS(
                                          firstName: firstName,
                                          lastName: lastName,
                                          phone: cleanPhone(phone),
                                          context: context,
                                        );
                                        if (context.mounted) {
                                          showSnackBar(context,
                                              'Dados atualizados com sucesso!');
                                        }
                                      }
                                    },
                                    text: 'Atualizar Perfil',
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  CustomButton(
                                      onTap: () {
                                        if (context.mounted) {
                                          Navigator.pushNamed(
                                              context,
                                              PhysioChangeEmailScreen
                                                  .routeName);
                                        }
                                      },
                                      text: 'Alterar Email'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  CustomButton(
                                      onTap: () {
                                        if (context.mounted) {
                                          Navigator.pushNamed(
                                              context,
                                              PhysioChangePasswordScreen
                                                  .routeName);
                                        }
                                      },
                                      text: 'Mudar Senha'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  CustomButton(
                                      onTap: () {
                                        if (context.mounted) {
                                          Navigator.pushNamed(context,
                                              PhysioDeleteAccount.routeName);
                                        }
                                      },
                                      text: 'Deletar Conta')
                                ],
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text("Error: ${snapshot.error}");
                        } else {
                          return const CircularProgressIndicator();
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
