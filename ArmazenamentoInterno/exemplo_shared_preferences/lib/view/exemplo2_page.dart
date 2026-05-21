import 'package:exemplo_shared_preferences/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Exemplo2Page extends StatefulWidget {
  const Exemplo2Page({super.key});

  @override
  State<Exemplo2Page> createState() => _Exemplo2PageState();
}

class _Exemplo2PageState extends State<Exemplo2Page> {
  late SharedPreferences _prefs;

  bool _darkmode = false;

  @override
  void initState() {
    super.initState();
    _loadPrefences();
  }

  void _loadPrefences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _darkmode = _prefs.getBool("darkMode") ?? false;
    });
  }

  void savePreferences() async {
    setState(() {
      _darkmode = !_darkmode;
    });
    await _prefs.setBool("darkMode", _darkmode);
    themeModeNotifier.value = _darkmode ? ThemeMode.dark : ThemeMode.light; // notifica o main
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Modo Escuro com Shared Preferences")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Tema Atual: ${_darkmode ? "Escuro" : "Claro"}"),
            Switch(value: _darkmode, onChanged: (_) => savePreferences()),
          ],
        ),
      ),
    );
  }
}