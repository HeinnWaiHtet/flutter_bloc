import 'package:bloc_pattern/bloc_page/bloc_event.dart';
import 'package:bloc_pattern/bloc_page/bloc_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final key = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.pink),
        child: Column(
          children: [
            SizedBox(height: 80,),

            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
              children: [
                SizedBox(height: 60,),

                Center(
                child: Text(
                  "Login",
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 23,
                     fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 15,),

                Center(
                  child: Text(
                    "Please Lgoin",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                  ),
                ),

                SizedBox(height: 20),
                ],
              ),
            ),

            Expanded(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(color: Colors.white),
                              child: Column(
                                children: [
                                  Form(
                                    key: key,
                                    child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(width: 1, color: Colors.pink),
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: emailController,
                                          decoration: InputDecoration(
                                            hintText: "Enter Your name",
                                            border: InputBorder.none,
                                          ),
                                          validator: (val){
                                            if(val == null || val.isEmpty){
                                              return "Email Must Not Be Empty";
                                            }
                                          },
                                        ),
                                      ),
                                      
                                      SizedBox(height: 20,),

                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(width: 1, color: Colors.pink),
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: passwordController,
                                          decoration:InputDecoration(
                                            hintText: "Enter Your Password",
                                            border: InputBorder.none,
                                          ),
                                          validator: (val){
                                            if(val == null || val.isEmpty){
                                              return "Password Must Not Be Empty";
                                            }
                                          },
                                        ),
                                      ),
                                     ],
                                    ),
                                  ),

                                  SizedBox(height: 20),

                                  TextButton(
                                    onPressed: (){
                                      // add register event when click
                                      BlocProvider.of<BlocPage>(context).add(RegisterEvent());
                                    },
                                    child: Text(
                                      "Create New Account",
                                      ),
                                    ),

                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.pink,
                                      ),
                                      height: 50,
                                      width: MediaQuery.of(context).size.width * 0.5,
                                      child: OutlinedButton(
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                          ),
                                        ),
                                        onPressed: (){
                                          if(key.currentState!.validate()){
                                            
                                          }
                                        },
                                      ),
                                    )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}