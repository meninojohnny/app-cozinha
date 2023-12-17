import 'package:flutter/material.dart';

class DrawerMain extends StatelessWidget {
  const DrawerMain({super.key});

  Widget _createItem(IconData icon, String title) {
    return ListTile(
      onTap: () {},
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
            _createItem(Icons.restaurant, 'Refeições'),
            _createItem(Icons.settings, 'Configurações'),
          ],
        ),
      );
  }
}