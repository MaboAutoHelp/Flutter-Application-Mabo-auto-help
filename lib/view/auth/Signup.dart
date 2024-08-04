import 'package:flutter/material.dart';
import 'package:mabo_auto_help/controller/Authcontroller.dart';
import 'package:mabo_auto_help/view/auth/Login.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController pwd = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController tel = TextEditingController();

  GlobalKey<FormState> fromstate = GlobalKey<FormState>();

  Authcontroller authcontroller = Authcontroller();

  Signup() async {
    var formData = fromstate.currentState;

    if (formData!.validate()) {
      var data = await authcontroller.SignupAuth(name.text,email.text, pwd.text,tel.text);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
    } else {
      print('Form is invalid');
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: fromstate,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Mabo auto help',
              style: TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 244, 59, 3)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 30, color: Colors.lightBlue),
                  ),
                ],
              ),
            ),

            ///------------------Name---------------------
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: name,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'name is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Name",
                  prefixIcon: Icon(Icons.person),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),

            ///------------------Email---------------------
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: email,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
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

            ///------------------TEL---------------------
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: tel,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Tel is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Tel",
                  prefixIcon: Icon(Icons.twelve_mp),
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
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
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
                  Signup();
                 
                },
                child: Text('Sign Up'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      'Login->',
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
