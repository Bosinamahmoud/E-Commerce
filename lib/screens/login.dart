import 'package:ecommerce/remote/auth/firebase_helper.dart';
import 'package:ecommerce/screens/Home.dart';
import 'package:ecommerce/screens/forgetPassword.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  String email;
  String password;
  String name;

  login({super.key, this.email = "", this.password = "", this.name = ""});

  @override
  _loginState createState() => _loginState();
}


class _loginState extends State<login> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;


  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: widget.email);
    passwordController = TextEditingController(text: widget.password);
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(""),),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Login",
                  style: TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold,),),
                SizedBox(height: 20),
                TextFormField(
                    controller: emailController,
                    onTapOutside: (value) {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // wait database
                    onFieldSubmitted: (value) {},
                    decoration: InputDecoration(labelText: 'Email',
                        labelStyle: TextStyle(fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey),),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      else if (!EmailValidator.validate(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    }

                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: passwordController,
                  onTapOutside: (value) {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // wait database
                  onFieldSubmitted: (value) {},
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),

                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons
                              .visibility_off,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey),),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      signInAction();
                      //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));

                      //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>signUp()));
                      // Action to perform when button is pressed
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Theme
                        .of(context)
                        .primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),

                    child: Text("LOGIN",
                      style: TextStyle(fontSize: 20, color: Colors.white),),
                  ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Forgot your Password ?"),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) =>
                                  forgetPassword()));
                        },
                        icon: Icon(
                          Icons.arrow_forward_rounded,
                          color: Theme
                              .of(context)
                              .primaryColor,
                        ))
                  ],
                ),

              ],
            ),
          ),
        ),
      ),);
  }

  void signInAction() async {
    await FirebaseHelper()
        .signIn(
      emailController.text.toString(), passwordController.text.toString(),)
        .then((value) =>{
          if(value is User){
        Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home()))
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
/* if (_formKey.currentState!.validate()) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Home()));
    }*/