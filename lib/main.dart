import 'package:bloc_pattern/bloc_page/bloc_event.dart';
import 'package:bloc_pattern/bloc_page/bloc_page.dart';
import 'package:bloc_pattern/screen/home.dart';
import 'package:bloc_pattern/screen/login_screen.dart';
import 'package:bloc_pattern/screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_page/bloc_state.dart';

void main() {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<BlocPage>(
        create: (BuildContext context) => BlocPage())
    ],
    child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bloc Pattern',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
 
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<BlocPage>(context).add(LoginEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BlocPage, BlocState>(
        builder: (BuildContext context, state){
          if(state is LoginState){
            return LoginScreen();
          }else if(state is RegisterState){
            return RegisterScreen();
          }else{
            return Home();
          }
        },
      ),
    );
  }
}
