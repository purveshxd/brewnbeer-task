import 'package:brewnbeer_task/constants/constants.dart';
import 'package:brewnbeer_task/database/theme_database.dart';
import 'package:brewnbeer_task/model/custom_theme_model.dart';
import 'package:brewnbeer_task/provider/theme_provider.dart';
import 'package:brewnbeer_task/widget/custom.theme.dialog.dart';
import 'package:brewnbeer_task/widget/example_widget.dart';
import 'package:brewnbeer_task/widget/rounded_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    debugPrint(ref.watch(customThemeProvider).toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Changer"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/background.jpg"),
                    fit: BoxFit.fill),
              ),
              child: const ExampleWidget(),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedButton(
                      onPressed: () {
                        ref
                            .read(currentThemeProvider.notifier)
                            .update((state) => 'default');
                        ThemeDatabase().resetTheme();
                      },
                      label: "Reset",
                      color: Colors.red.shade400,
                    ),
                    RoundedButton(
                      onPressed: () {
                        ThemeDatabase().setTheme(CustomTheme(
                            primaryColor: Theme.of(context).colorScheme.primary,
                            accentColor:
                                Theme.of(context).dialogBackgroundColor));
                      },
                      label: "Save",
                    ),
                  ],
                ),
                ListTile(
                  title: const Text("Light theme"),
                  trailing: const Icon(Icons.light_mode_rounded),
                  onTap: () => ref
                      .read(currentThemeProvider.notifier)
                      .update((state) => Constants.lightTheme),
                ),
                ListTile(
                  title: const Text("Dark theme"),
                  trailing: const Icon(Icons.dark_mode_rounded),
                  onTap: () => ref
                      .read(currentThemeProvider.notifier)
                      .update((state) => Constants.darkTheme),
                ),
                ListTile(
                  trailing: const Icon(Icons.android_rounded),
                  title: const Text("System theme"),
                  onTap: () => ref
                      .read(currentThemeProvider.notifier)
                      .update((state) => Constants.systemTheme),
                ),
                ListTile(
                    title: const Text("Custom theme"),
                    trailing: const Icon(Icons.person_rounded),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => const CustomThemeDialog());
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
