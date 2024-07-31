import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController pwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Mabo auto help',
            style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 244, 59, 3))),



        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                'Login',
                style: TextStyle(fontSize: 30, color: Colors.lightBlue),
              ),
            ],
          ),
        ),

        ///------------------Email---------------------
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: email,
            decoration: InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.email),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),

        ///-------------------Pwd--------------------
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: pwd,
            decoration: InputDecoration(
              hintText: "password",
              prefixIcon: Icon(Icons.password),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),

        ///--------------------------------------
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              print(email.text);
              print(pwd.text);
            },
            child: Text('Login'),
            
          ),
        )
      ],
    ));
  }
}
