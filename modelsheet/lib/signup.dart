import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _isloading = false;
  final passFN = FocusNode();
  final cPassFN = FocusNode();
  final buttonFN = FocusNode();
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  var email = '';
  var pass = '';
  var conPass = '';
  final passController = TextEditingController();
  final conPassController = TextEditingController();
  bool _showPass = false;
  bool _showCPass = false;
  emptyFields() {
    // emailController.text = '';
    passController.text = '';
    conPassController.text = '';
    setState(() {});
  }

  void onSaved() {
    if (formKey.currentState!.validate()) {
      formKey.currentState?.save();
      setState(() {
        email = emailController.text;
        pass = passController.text;
        conPass = conPassController.text;
      });
      registation();
    }
  }

  void showSnak(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  registation() async {
    if (pass == conPass) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: pass);
        setState(() {
          _isloading = true;
        });
        setState(() {
          _isloading = false;
        });
        showSnak('SignUp succesFully');
      } on FirebaseAuthException catch (error) {
        if (error.code == 'email-already-in-use') {
          showSnak('email already in use');
        }
      } catch (error) {
        setState(() {
          _isloading = false;
        });
        showSnak(error.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: emailController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    label: Text('Email'),
                    hintText: 'Example@gmail.com'),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(passFN);
                },
                validator: (emailValue) {
                  if (!emailValue!.contains('@')) {
                    return 'invalid email';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passController,
                obscureText: _showPass,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _showPass = !_showPass;
                      });
                    },
                    icon: Icon(
                        _showPass ? Icons.visibility : Icons.visibility_off),
                  ),
                  label: const Text('Password'),
                  border: const OutlineInputBorder(),
                ),
                focusNode: passFN,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(cPassFN);
                },
                validator: (passValue) {
                  if (passValue!.length < 8) {
                    return 'maximum password char > 8';
                  }
                  if (conPassController.text != passController.text) {
                    return 'password dosnt match';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: conPassController,
                obscureText: _showCPass,
                textInputAction: TextInputAction.next,
                focusNode: cPassFN,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _showCPass = !_showCPass;
                      });
                    },
                    icon: Icon(
                        _showCPass ? Icons.visibility : Icons.visibility_off),
                  ),
                  label: const Text('Confirm Psssword'),
                  border: const OutlineInputBorder(),
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(buttonFN);
                },
                validator: (conpass) {
                  if (conpass!.length < 8) {
                    return 'maximum password char > 8';
                  }
                  if (conPassController.text != passController.text) {
                    return 'password dosnt match';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    focusNode: buttonFN,
                    onPressed: onSaved,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      primary: Colors.green,
                    ),
                    child: _isloading
                        ? const CircularProgressIndicator()
                        : const Text('Register'),
                  ),
                  ElevatedButton(
                    //                focusNode: buttonFN,
                    onPressed: emptyFields,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
