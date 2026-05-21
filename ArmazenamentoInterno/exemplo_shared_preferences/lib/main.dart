import 'package:exemplo_shared_preferences/view/Exemplo1_page.dart';
import 'package:exemplo_shared_preferences/view/Exemplo2_page.dart';
import 'package:exemplo_shared_preferences/view/Exemplo3_page.dart';
import 'package:exemplo_shared_preferences/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier(ThemeMode.light);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool darkMode = prefs.getBool("darkMode") ?? false;
  themeModeNotifier.value = darkMode ? ThemeMode.dark : ThemeMode.light;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (context, themeMode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeMode,
          routes: {
            "/tela1": (context) => Exemplo1Page(),
            "/tela2": (context) => Exemplo2Page(),
            "/tela3": (context) => Exemplo3Page(),
          },
          home: const HomePage(),
        );
      },
    );
  }
}