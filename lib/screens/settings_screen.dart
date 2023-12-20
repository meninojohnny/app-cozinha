import 'package:cozinha/components/drawer_main.dart';
import 'package:cozinha/models/settings.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;
  final Settings settings;

  SettingsScreen({super.key, required this.onSettingsChanged, required this.settings});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;

  @override
  void initState() {
    // TODO: implement initState
    settings = widget.settings;
  }

  Widget _createSwitch({
    required bool value, 
    required String title, 
    required String subtitle, 
    required Function(bool) onChanged,
  }) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(widget.settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Container(
          alignment: Alignment.center,
          child: const Text('Configurações', style: TextStyle(color: Colors.white)),
        ),
      ),
      drawer: const DrawerMain(),
      body: Column(
        children: [
          Container(
            height: 40,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          _createSwitch(
            value: settings.isLactoseFree, 
            title: 'Sem lactose', 
            subtitle: 'Só exibe refeições sem lactose', 
            onChanged: (value) {
              setState(() {
                settings.isLactoseFree = value;
              });
            }
          ),
          _createSwitch(
            value: settings.isGlutenFree, 
            title: 'Sem Glutem', 
            subtitle: 'Só exibe refeições sem glutem', 
            onChanged: (value) {
              setState(() {
                settings.isGlutenFree = value;
              });
            }
          ),
          _createSwitch(
            value: settings.isVegan, 
            title: 'Só veganas', 
            subtitle: 'Só exibe refeições veganas', 
            onChanged: (value) {
              setState(() {
                settings.isVegan = value;
              });
            }
          ),
          _createSwitch(
            value: settings.isVegetarian, 
            title: 'Só vegetarianas', 
            subtitle: 'Só exibe refeições vegetarianas',
            onChanged: (value) {
              setState(() {
                settings.isVegetarian = value;
              });
            }
          ),
        ],
      ),
    );
  }
}