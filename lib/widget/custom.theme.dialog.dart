import 'package:brewnbeer_task/constants/constants.dart';
import 'package:brewnbeer_task/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomThemeDialog extends ConsumerWidget {
  const CustomThemeDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    final container = ref.read(customThemeProvider.notifier);

    Color primaryColor = ref.watch(primaryColorProvider);
    Color accentColor = ref.watch(accentColorProvider);
    // ImageProvider? backgroundImage = null;
    return AlertDialog(
      actions: [
        TextButton(
            onPressed: () {
              ref
                  .watch(currentThemeProvider.notifier)
                  .update((state) => Constants.userTheme);

              Navigator.pop(context);
            },
            child: const Text("Apply"))
      ],
      title: const Text("Custom Colors"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text("Primary Color"),
            trailing: CircleAvatar(
              backgroundColor: primaryColor,
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text("Select Primary Color"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Done"))
                        ],
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ColorPicker(
                              pickerColor: primaryColor,
                              onColorChanged: (color) {
                                ref
                                    .read(primaryColorProvider.notifier)
                                    .update((state) => color);
                              },
                            )
                          ],
                        ),
                      ));
            },
          ),
          ListTile(
            title: const Text("Accent Color"),
            trailing: CircleAvatar(backgroundColor: accentColor),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text("Select Accent Color"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Done"))
                        ],
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ColorPicker(
                              pickerColor: accentColor,
                              onColorChanged: (color) {
                                ref
                                    .read(accentColorProvider.notifier)
                                    .update((state) => color);
                              },
                            )
                          ],
                        ),
                      ));
            },
          ),

          //
          // ListTile(
          //   title: const Text('Text Style'),
          //   trailing: Text(
          //     'Sample Text',
          //     style: selectedTextStyle,
          //   ),
          //   onTap: () {
          //     showDialog(
          //       context: context,
          //       builder: (BuildContext context) {
          //         return AlertDialog(
          //           title: const Text('Select Text Style'),
          //           content: SingleChildScrollView(
          //             child: ListBody(
          //               children: [
          //                 ListTile(
          //                   title: const Text('Default'),
          //                   onTap: () {
          //                     ref
          //                         .watch(textStyleProvider.notifier)
          //                         .update((state) => const TextStyle());
          //                     Navigator.of(context).pop();
          //                   },
          //                 ),
          //                 ListTile(
          //                   title: const Text(
          //                     'Bold',
          //                     style: TextStyle(fontWeight: FontWeight.bold),
          //                   ),
          //                   onTap: () {
          //                     ref.read(textStyleProvider.notifier).update(
          //                           (state) => themeData
          //                               .dialogTheme.titleTextStyle
          //                               ?.copyWith(fontWeight: FontWeight.bold),
          //                         );
          //                     Navigator.of(context).pop();
          //                   },
          //                 ),
          //                 ListTile(
          //                   title: Text(
          //                     'Italic',
          //                     style: const TextStyle()
          //                         .copyWith(fontStyle: FontStyle.italic),
          //                   ),
          //                   onTap: () {
          //                     ref.read(textStyleProvider.notifier).update(
          //                           (state) => state?.copyWith(
          //                               fontStyle: FontStyle.italic),
          //                         );
          //                     Navigator.of(context).pop();
          //                   },
          //                 ),
          //               ],
          //             ),
          //           ),
          //           actions: [
          //             TextButton(
          //               child: const Text('Cancel'),
          //               onPressed: () {
          //                 Navigator.of(context).pop();
          //               },
          //             ),
          //           ],
          //         );
          //       },
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
