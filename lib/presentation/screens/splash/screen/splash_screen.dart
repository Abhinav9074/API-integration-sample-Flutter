import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project2/application/splash_bloc/splash_bloc.dart';
import 'package:mini_project2/application/splash_bloc/splash_state.dart';
import 'package:mini_project2/presentation/screens/home/screen/home_screen.dart';


class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc,SplashState>(
      listener: (context,state){
        if(state is SplashLoadedLoginState){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> const HomeScreen()));
        }
          
      },
      child: Scaffold(
        body: Center(
          child: Image.asset('assets/images/load.gif'),
        ),
      ),
      );
  }


}
