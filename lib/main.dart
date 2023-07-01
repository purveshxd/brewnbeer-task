import 'package:brewnbeer_task/database/theme_database.dart';
import 'package:brewnbeer_task/provider/theme_provider.dart';
import 'package:brewnbeer_task/screen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
late ThemeData defaultTheme;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  defaultTheme = ThemeDatabase().getTheme();
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(useMaterial3: true),
      home: const HomePage(    ),
    );
  }
}
