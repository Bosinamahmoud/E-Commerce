import 'package:ecommerce/screens/Home.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class forgetPassword extends StatelessWidget {
   forgetPassword({super.key});
   final _formKey = GlobalKey<FormState>();

   late TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
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
                  "Forgot Password",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextFormField(

                    onTapOutside: (value) {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // wait database
                    onFieldSubmitted: (value) {},
                    decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!EmailValidator.validate(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    }),
                SizedBox(height: 20),

                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {

                      /*  Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Home()));*/
                        if(_formKey.currentState!.validate()) {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Home()));
                        }
                      //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));

                      //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>signUp()));
                      // Action to perform when button is pressed
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                        "SEND ",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
