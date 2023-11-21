import 'package:flutter/material.dart';

import '../../../../../core/themes/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  final void Function() onChangePasswordTap;
  final void Function() onSignOutTap;

  const HomeDrawer({
    super.key,
    required this.onChangePasswordTap,
    required this.onSignOutTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Menu'),
          backgroundColor: AppTheme.mainColor,
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        body: Align(
          alignment: Alignment.bottomRight,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DrawerItem(
                label: 'iagocbudev@gmail.com',
                icon: Icons.mail,
                onTap: () {},
              ),
              DrawerItem(
                label: 'Alterar senha',
                icon: Icons.lock,
                onTap: onChangePasswordTap,
              ),
              DrawerItem(
                label: 'Sair',
                icon: Icons.logout,
                onTap: onSignOutTap,
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text('Versão 1.0.0'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function() onTap;

  const DrawerItem({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        title: Text(label),
        leading: Icon(icon),
      ),
    );
  }
}
