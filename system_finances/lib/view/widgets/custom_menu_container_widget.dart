import 'package:flutter/material.dart';
import 'package:system_finances/models/user_model.dart';
import 'package:system_finances/services/prefs_services.dart';
import 'package:system_finances/view/components/home/custom_linear_home_contact.dart';

class CustomMenuContainerWidget extends StatelessWidget {
  const CustomMenuContainerWidget({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomLinearContactWidget(
            contactName: user.name,
            pathContactImage: user.image,
          ),
          IconButton(
            onPressed: () {
              PrefsService.logout();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login', (_) => true);
            },
            icon: const Icon(Icons.logout),
            alignment: Alignment.topRight,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
