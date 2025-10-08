import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/data_service.dart';
import 'services/theme_service.dart';
import 'screens/home_screen.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const SereneSync());
}

class SereneSync extends StatelessWidget {
  const SereneSync({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataService()),
        ChangeNotifierProvider(create: (context) => ThemeService()),
      ],
      child: Consumer2<DataService, ThemeService>(
        builder: (context, dataService, themeService, child) {
          return MaterialApp(
            title: 'SereneSync',
            debugShowCheckedModeBanner: false,
            theme: themeService.lightTheme,
            darkTheme: themeService.darkTheme,
            themeMode: themeService.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: dataService.isSetupComplete
                ? const HomeScreen()
                : const WelcomeScreen(),
          );
        },
      ),
    );
  }
}
