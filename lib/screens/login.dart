import 'package:ecommerce/screens/Home.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
class login extends StatefulWidget {
  String email="";
  String password="";
   login({super.key,required this.email, required this.password});

  @override

  _loginState createState() => _loginState();
}


class _loginState extends State<login> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    String email=widget.email;
    String password=widget.password;
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
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  onTapOutside: (value){
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // wait database
                  onFieldSubmitted: (value){},
                  decoration: InputDecoration(labelText: 'Email',
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey),),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
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
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  onTapOutside: (value){
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // wait database
                  onFieldSubmitted: (value){},
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Password',
                      suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.grey),),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
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
                          MaterialPageRoute(builder: (context) => Home()));
                    }
                  //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));

                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>signUp()));
                    // Action to perform when button is pressed
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),

                  child: Text("LOGIN",style: TextStyle(fontSize: 20,color: Colors.white),),
                ), )

              ],
            ),
          ),
        ),
      ),);
  }

}