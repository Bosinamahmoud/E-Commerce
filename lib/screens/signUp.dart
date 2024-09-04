import 'package:ecommerce/screens/login.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
class signUp extends StatefulWidget {
  @override
  _signUpState createState() => _signUpState();
}


class _signUpState extends State<signUp> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                Text("Sign up",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  onTapOutside: (value){
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(labelText: 'Name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.grey),),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
                  // wait database
                  onFieldSubmitted: (value){},
                  keyboardType: TextInputType.name,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  onTapOutside: (value){
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  decoration: InputDecoration(labelText: 'Email'  ,border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey),),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
                  keyboardType: TextInputType.emailAddress,
                  // wait database
                  onFieldSubmitted: (value){},
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
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  onTapOutside: (value){
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Password', suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.grey),),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
                  //maxLength: 10,
                  // wait database
                  onFieldSubmitted: (value){},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    else if(value.length <5){
                      return 'password must be at least 5 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child:  ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()) {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => login(email: _emailController.text,password: _passwordController.text, name: _nameController.text,)));
                      }
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>signUp()));
                      // Action to perform when button is pressed
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),

                    child: Text("SIGN UP",style: TextStyle(fontSize: 20,color: Colors.white),),
                  ), )
              ],
            ),
          ),
        ),
      ),);
  }

}