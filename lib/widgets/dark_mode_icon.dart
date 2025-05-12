import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winner_2d/providers/theme_provider.dart';

class DarkModeIcon extends StatefulWidget {
  const DarkModeIcon({super.key});

  @override
  State<DarkModeIcon> createState() => _DarkModeIconState();
}

class _DarkModeIconState extends State<DarkModeIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              final themeProvider = Provider.of<ThemeProvider>(
                context,
                listen: false,
              );
              themeProvider.setDarkTheme =
                  !themeProvider.getDarkTheme;
            },
            child: Icon(
              context.watch<ThemeProvider>().getDarkTheme
                  ? Icons.dark_mode
                  : Icons.light_mode,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
