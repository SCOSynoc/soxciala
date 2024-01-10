
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideProfileDrawer extends StatelessWidget {
  const SideProfileDrawer({Key? key, required this.updateProfile, required this.logout, required this.updateProfileImage})
      : super(key: key);
  final VoidCallback updateProfile;
  final VoidCallback logout;
  final VoidCallback updateProfileImage;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            hoverColor:Colors.transparent ,
            splashColor: Colors.transparent,
            title: const Text('Settings'),
            onTap: updateProfile,
          ),
          ListTile(
            leading: const Icon(
              Icons.camera,
            ),
            title: const Text('Update Image'),
            onTap: updateProfileImage,
          ),
          ListTile(
            leading: const Icon(
              Icons.account_box_rounded,
            ),
            title: const Text('Update profile'),
            onTap: updateProfile,
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
            ),
            title: const Text('Logout'),
            onTap: logout,
          ),
        ],
      ),
    );
  }
}
