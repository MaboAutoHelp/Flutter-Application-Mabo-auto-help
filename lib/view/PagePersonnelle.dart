import 'package:flutter/material.dart';
import 'package:mabo_auto_help/controller/PagepersonnelleContriller.dart';

class Pagepersonnelle extends StatefulWidget {
  final String adminID;
  const Pagepersonnelle({super.key, required this.adminID});

  @override
  State<Pagepersonnelle> createState() => _PagepersonnelleState();
}

class _PagepersonnelleState extends State<Pagepersonnelle> {
  TextEditingController email = TextEditingController();
  TextEditingController pwd = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController tel = TextEditingController();

  GlobalKey<FormState> fromstate = GlobalKey<FormState>();

  PagepersonnelleContriller pagepersonnelleContriller = PagepersonnelleContriller();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    var userData = await pagepersonnelleContriller.GetUser(widget.adminID);
    setState(() {
      email.text = userData['email'];
      name.text = userData['name'];
      tel.text = userData['tel'];
      pwd.text = userData['pwd'];
    });
  }

  Future<void> _updateUserData() async {
    if (fromstate.currentState!.validate()) {
      var userData = {
        'email': email.text,
        'name': name.text,
        'tel': tel.text,
        'pwd': pwd.text,
      };
      var success = await pagepersonnelleContriller.UpdateUser(widget.adminID, userData);
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User data updated successfully')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to update user data')));
      }
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _updateUserData,
                child: Text('Edit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
