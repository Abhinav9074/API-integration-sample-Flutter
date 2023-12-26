import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project2/application/splash_bloc/splash_bloc.dart';
import 'package:mini_project2/presentation/screens/splash/screen/splash_screen.dart';
import 'package:mini_project2/presentation/themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fake Post App',
      theme: myTheme,
      home: BlocProvider(
        create: (context) => SplashBloc(),
        child: SplashScreen(),
      ),
    );
  }
}
