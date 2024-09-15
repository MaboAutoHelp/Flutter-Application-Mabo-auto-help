/*import 'package:flutter/material.dart';
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
      var data = await authcontroller.SignupAuth(name.text,email.text,pwd.text,tel.text);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
    } else {
      print('Form is invalid');
    }
  }


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
}*/
import 'package:flutter/material.dart';
import 'package:mabo_auto_help/controller/Authcontroller.dart';
import 'package:mabo_auto_help/view/auth/Login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

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

  Future<void> Signup() async {
    var formData = fromstate.currentState;

    if (formData!.validate()) {
      var data = await authcontroller.SignupAuth(
        name.text, 
        email.text, 
        pwd.text, 
        tel.text,
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    } else {
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,  // الخلفية بيضاء
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: fromstate,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Mabo Auto Help',
                    style: TextStyle(
                      fontSize: 30, 
                      color: Color(0xFF003366),  // أزرق داكن
                    ),
                  ),
                  SizedBox(height: 16),

                  Row(
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 30, 
                          color: Color(0xFF003366),  // أزرق داكن
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),

                  ///------------------Name---------------------
                  TextFormField(
                    controller: name,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Name",
                      prefixIcon: Icon(Icons.person, color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  ///------------------Email---------------------
                  TextFormField(
                    controller: email,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Email is required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email, color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  ///------------------TEL---------------------
                  TextFormField(
                    controller: tel,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Tel is required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Tel",
                      prefixIcon: Icon(Icons.phone, color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  ///-------------------Pwd--------------------
                  TextFormField(
                    controller: pwd,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock, color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),

                  ///--------------------------------------
                  ElevatedButton(
                    onPressed: Signup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFD700),  // زر أصفر
                    ),
                    child: Text('Sign Up', style: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Text(
                          'Login ->',
                          style: TextStyle(
                            color: Color(0xFF003366),  // أزرق داكن
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

