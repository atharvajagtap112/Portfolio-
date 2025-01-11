import 'package:flutter/material.dart';
import 'package:portfolio/Providers/current_state.dart';
import 'package:portfolio/Providers/theme_provider.dart';
import 'package:portfolio/Screen/home_page.dart';
import 'package:portfolio/Screen/loading_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ 
         ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) =>CurrentState() , )],
      child: const MaterialApp(
        home: RiveLoadingScreen(child: HomePage(),riveAssetPath: "assets/rive/pull-to-refresh_animation_example.riv", ),
      ),
    );
  } 
}
