import 'package:ecommerce/providers/userProvider.dart';
import 'package:ecommerce/remote/auth/firebase_helper.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class signUp extends StatefulWidget {
  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<userProvider>(context);
    final emailprovider = Provider.of<userProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign up",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextFormField(
                  onChanged: (value) {
                    userprovider.setName(value);
                  },
                  controller: nameController,
                  onTapOutside: (value) {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                  // wait database
                  onFieldSubmitted: (value) {},
                  keyboardType: TextInputType.name,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                    onChanged: (value) {
                      emailprovider.setEmail(value);
                    },
                    controller: emailController,
                    onTapOutside: (value) {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                    keyboardType: TextInputType.emailAddress,
                    // wait database
                    onFieldSubmitted: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!EmailValidator.validate(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    }),
                SizedBox(height: 30),
                TextFormField(
                  controller: passwordController,
                  onTapOutside: (value) {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  obscureText: _obscureText,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                  //maxLength: 10,
                  // wait database
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 5) {
                      return 'password must be at least 5 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      signUpAction();
                     /* if (_formKey.currentState!.validate()) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name: nameController.text,
                                )));
                      }*/
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>signUp()));
                      // Action to perform when button is pressed
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("already have an account ?"),
                    IconButton(
                        onPressed: () {

                           Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => login()));
                        },
                        icon: Icon(
                          Icons.arrow_forward_rounded,
                          color: Theme.of(context).primaryColor,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUpAction() async {
    await FirebaseHelper()
        .signUp(
            emailController.text.toString(),
            passwordController.text.toString(),
            nameController.text.toString())
        .then((value) => {
              if (value is User && _formKey.currentState!.validate())
                {
        Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => login(
          email: emailController.text,
          password: passwordController.text,
          name: nameController.text,
        )))
                }
              else if (value is String)
                {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                      SnackBar(
                          content: Text(
                              value.toString()),
                      backgroundColor: Colors.red,))
                }
            });
  }
}
