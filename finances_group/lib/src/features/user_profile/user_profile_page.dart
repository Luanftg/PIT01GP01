import 'dart:io';

import 'package:finances_group/src/data/repositories/firebase_auth_repository.dart';
import 'package:finances_group/src/features/user_profile/user_profile_controller.dart';
import 'package:finances_group/src/models/user_model.dart';
import 'package:finances_group/src/shared/design/colors/app_custom_colors.dart';
import 'package:finances_group/src/shared/design/theme/text_theme.dart';
import 'package:finances_group/src/shared/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key, required this.userModel});
  final UserModel userModel;
  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

final nameController = TextEditingController();
final emailController = TextEditingController();
final passwordController = TextEditingController();

final globalKey = GlobalKey<FormState>();

class _UserProfilePageState extends State<UserProfilePage> {
  final UserProfileController userProfileController =
      UserProfileController(FirebaseAuthRepository(FirebaseAuth.instance));

  @override
  void initState() {
    super.initState();
    nameController.text = widget.userModel.name;
    emailController.text = widget.userModel.email;
    // passwordController.text = widget.userModel.password ?? '';
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    // passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile Page'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: globalKey,
            child: Column(
              children: [
                CircleAvatar(
                  radius: width * 0.2,
                  child: ClipOval(
                    child: widget.userModel.photoURL?.isEmpty ?? true
                        ? Image.network(
                            "https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg",
                            fit: BoxFit.fitWidth,
                            width: width * 0.4,
                          )
                        : Image.file(
                            File(widget.userModel.photoURL ?? ''),
                            fit: BoxFit.fitWidth,
                            width: width * 0.4,
                          ),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppCustomColors.secondary),
                  ),
                  onPressed: () async {
                    var xFile =
                        await picker.pickImage(source: ImageSource.gallery);
                    widget.userModel.photoURL = xFile?.path;
                    setState(() {});
                  },
                  child: Text(
                    'Galeria',
                    style: CustomAppTextTheme.blackCaption,
                  ),
                ),
                const SizedBox(height: 32),
                CustomTextFormField(
                  icon: Icons.person,
                  label: 'Nome',
                  typeKeyboard: TextInputType.name,
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                ),
                CustomTextFormField(
                  icon: Icons.email,
                  label: 'Email',
                  typeKeyboard: TextInputType.emailAddress,
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                ),
                // CustomTextFormField(
                //   icon: Icons.password,
                //   label: 'Senha',
                //   typeKeyboard: TextInputType.visiblePassword,
                //   controller: passwordController,
                //   textInputAction: TextInputAction.done,
                // ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () async {
                    bool? isFormValid = globalKey.currentState?.validate();

                    if (isFormValid!) {
                      if (widget.userModel.photoURL != null) {
                        await userProfileController
                            .updateUserPhotoUrl(widget.userModel.photoURL!);
                      }
                      await userProfileController
                          .updateUserName(nameController.text);

                      // await userProfileController
                      //     .updateUserPassword(passwordController.text);
                      await userProfileController
                          .updateUserEmail(emailController.text);
                    }
                  },
                  child: Text(
                    'Salvar Alterações',
                    style: CustomAppTextTheme.blackCaption,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
