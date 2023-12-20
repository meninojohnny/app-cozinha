import 'package:cozinha/utils/app_routes.dart';
import 'package:flutter/material.dart';

class DrawerMain extends StatelessWidget {
  const DrawerMain({super.key});

  Widget _createItem({required IconData icon, required String title, required Function onTap}) {
    return ListTile(
      onTap: () => onTap(),
      leading: Icon(icon),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: double.infinity,
              height: 50,
              child: const Text(
                'Vamos Cozinhar?', 
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
              ),
            ),
            _createItem(
              icon: Icons.restaurant, 
              title: 'Refeições',
              onTap: () {
                Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
              },
            ),
            _createItem(
              icon: Icons.settings, 
              title: 'Configurações',
              onTap: () => Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS)
            ),
          ],
        ),
      );
  }
}